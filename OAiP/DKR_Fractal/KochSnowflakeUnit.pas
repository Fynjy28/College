unit KochSnowflakeUnit;

interface

uses GraphABC;

procedure DrawSnowflake(x1, y1, x2, y2, x3, y3, size: Real; depth: Integer);
procedure UpdateCoords(var x1, y1: Real; size: Real; var x2, y2, x3, y3: Real);

implementation

procedure Draw(x, y, length, grad: Real; t: Integer); forward;
procedure Draw2(var x, y: Real; length, grad: Real; depth: Integer); forward;

procedure Draw(x, y, length, grad: Real; t: Integer);
begin
  if t > 0 then
  begin
    length := length / 3;
    Draw2(x, y, length, grad, t-1);
    Draw2(x, y, length, grad + Pi / 3, t-1);
    Draw2(x, y, length, grad - Pi / 3, t-1);
    Draw2(x, y, length, grad, t-1);
  end
  else
    Line(Round(x), Round(y), Round(x + Cos(grad) * length), Round(y - Sin(grad) * length));
end;

procedure Draw2(var x, y: Real; length, grad: Real; depth: Integer);
begin
  Draw(x, y, length, grad, depth);
  x := x + length * Cos(grad);
  y := y - length * Sin(grad);
end;

procedure UpdateCoords(var x1, y1: Real; size: Real; var x2, y2, x3, y3: Real);
var
  katet: Real;
begin
  x2 := x1 + size;
  katet := size / 2;
  x3 := x1 + katet;
  y2 := y1;
  y3 := y1 - katet * Power(3, 1/2);
end;

procedure Words;
begin
  textout(0, 0, 'Стрелки - передвижение фрактала');
  textout(0, 17, '+/- - изменение масштаба');
  textout(0, 34, 'O/P - изменение глубины фрактала');
end;

procedure DrawSnowflake(x1, y1, x2, y2, x3, y3, size: Real; depth: Integer);
begin
  LockDrawing;
  ClearWindow;
  Draw(x1, y1, size, pi/3, depth);
  Draw(x2, y2, size, pi, depth);
  Draw(x3, y3, size, -pi/3, depth);
  Words;
  Redraw;
end;

end.

