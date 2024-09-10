uses
  GraphABC, KochSnowflakeUnit;

var
  x1, y1, x2, y2, x3, y3, size: Real;
  depth: Integer;
 
procedure KeyDown(Key: Integer);
begin
  case Key of
    VK_Left: x1 := x1 - 10;
    VK_Right: x1 := x1 + 10;
    VK_Up: y1 := y1 - 10;
    VK_Down: y1 := y1 + 10;
    VK_O: if depth < 5 then depth += 1;
    VK_P: if depth >= 0 then depth -= 1;
    189: if size > 10 then size := size - 10;
    187: size := size + 10;
  end;
  UpdateCoords(x1, y1, size, x2, y2, x3, y3);
  DrawSnowflake(x1, y1, x2, y2, x3, y3, size, depth);
end;

begin
  SetWindowSize(500,500);
  SetWindowCaption('Снежинка Коха(или треугольник Коха)');
  size := 400;
  x1 := 100;
  y1 := 354;
  depth := 1; 
  UpdateCoords(x1, y1, size, x2, y2, x3, y3);
  DrawSnowflake(x1, y1, x2, y2, x3, y3, size, depth);
  OnKeyDown := KeyDown;
end.
