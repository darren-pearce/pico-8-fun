pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
 validate_questions()
end

function _update()
 quiz_state_update()
end

function _draw()

end
-->8
questions={
{
	"q1",
	{
		"possibility 1",
		"possibility 2",
	}
},
{
	"q2",
	{
		"possibility 1",
		"possibility 2",
	}
}
}

function validate_questions()
 foreach(questions,check_question)
end
-->8
function check_question(q)
 if #q == 2 then
  if #q[2] > 0 then
   return
  end
 end
 assert(false, "invalid question format")
end

function display_question(q)
 print(q[1],0,0)
end

function display_question_full(q)
 display_question(q)
 for i=1,#q[2] do
  print(q[2][i],0,i*8)
 end
end
-->8
quiz_state={
	q_index=0,
	a_index=1,
	state=1,
	state_last=0,
	state_timer=0
}

function quiz_state_update()
 local qs=quiz_state
 local first=qs.state~=qs.state_last
 qs.state_last=qs.state
 
 if first then state_timer=0 else state_timer+=1 end
 if qs.state==1 then
  -- init question
  qs.q_index+=1
  if #questions < qs.q_index then qs.state=10
  else qs.state=2 end
 elseif qs.state==2 then
  -- display question
 elseif qs.state==10 then
  -- quiz over
 end
end

function quiz_state_draw()

end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
