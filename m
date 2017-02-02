From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Thu, 02 Feb 2017 21:44:53 +0900
Message-ID: <589329C5.2070206@samsung.com>
References: <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay> <20170131150226.GB4519@ulmo.ba.sec>
 <87r33j85ap.fsf@eliezer.anholt.net> <20170131213132.GC872@mithrandir.ba.sec>
 <5891224E.5010402@samsung.com> <20170201144405.GA17698@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170201144405.GA17698-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Dear Thierry,


2017년 02월 01일 23:44에 Thierry Reding 이(가) 쓴 글:
> On Wed, Feb 01, 2017 at 08:48:30AM +0900, Inki Dae wrote:
>>
>>
>> 2017년 02월 01일 06:31에 Thierry Reding 이(가) 쓴 글:
>>> On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
>>>> Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>>>
>>>>> [ Unknown signature status ]
>>>>> On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
>>>>>> On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
>>>>>>> On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> 2017년 01월 24일 10:50에 Hoegeun Kwon 이(가) 쓴 글:
>>>>>>>>> Dear Thierry,
>>>>>>>>>
>>>>>>>>> Could you please review this patch?
>>>>>>>>
>>>>>>>> Thierry, I think this patch has been reviewed enough but no comment
>>>>>>>> from you. Seems you are busy. I will pick up this.
>>>>>>>
>>>>>>> Sorry, but that's not how it works. This patch has gone through 8
>>>>>>> revisions within 4 weeks, and I tend to ignore patches like that until
>>>>>>> the dust settles.
>>>>>>>
>>>>>>
>>>>>> Seems like the dust was pretty settled. It was posted on 1/11, pinged on 1/24,
>>>>>> and picked up on 1/31. I don't think it's unreasonable to take it through
>>>>>> another tree after that.
>>>>>>
>>>>>> I wonder if drm_panel would benefit from the -misc group maintainership model
>>>>>> as drm_bridge does. By spreading out the workload, the high-maintenance
>>>>>> patches would hopefully find someone to shepherd them through.
>>>>>
>>>>> Except that nobody except me really cares. If we let people take patches
>>>>> through separate trees or group-maintained trees they'll likely go in
>>>>> without too much thought. DRM panel is somewhat different from core DRM
>>>>> in this regard because its infrastructure is minimal and there's little
>>>>> outside the panel-simple driver. So we're still at a stage where we need
>>>>> to fine-tune what drivers should look like and how we can improve.
>>>>
>>>> I would love to care and participate in review, but with the structure
>>>> of your tree you're the only one whose review counts, so I don't
>>>> participate.
>>>
>>> Really? What exactly do you think is special about the structure of my
>>> tree? I require patches to be on dri-devel (I pick them up from the
>>> patchwork instance at freedesktop.org), the tree is publicly available
>>> and reviewed-by tags get picked up automatically by patchwork.
>>>
>>> The panel tree works exactly like any other maintainer tree. And my
>>> review is *not* the only one that counts. I appreciate every Reviewed-by
>>> tag I see on panel patches because it means that I don't have to look as
>>> closely as I have to otherwise.
>>
>> I don't think the panel tree works exactly like other maintainer tree.
>>
>> I'd like to recommend you to read below Greg's blog. This blog says
>> about *Role of a Linux Kernel Maintainer*.
>> http://www.kroah.com/log/linux/maintainer_pledge.html
> 
> Okay, now you're being unfair. You can't compare people to Greg. He
> is beyond human.
> 
>> Especially, I'd like to emphasize below things,
>> - I will review your patch within 1-2 weeks.
>> - I will offer semi-constructive criticism of your patches.
>> - I will let you know the status of your patch if it is rejected, or
>> if it is accepted, what tree it has gone into, where you can find it,
>> and when you can expect to see it merged into Linus's tree.
> 
> First, this is a pledge by Greg, and you can hardly hold me to this if
> it isn't coming from me. I agree that the above is ideal, but I'm also
> much less efficient as a maintainer as Greg. So are many others. There
> simply isn't enough bandwidth to be able to do the above in every case
> in addition to the day job and real life.
> 
> That said, when I do get around to review patches I think I'm pretty
> good at the second and third points, though.

Agree. You did well really.

> 
> Secondly, it's very convenient how you focus on the maintainers' duties
> and completely leave out what maintainers expect from contributors. If
> you go and read some of the references linked to by Greg's post, maybe
> you'll understand my position a little better as well.
> 
>> Why do you ignore contributor's patch? Even though the patch is ugly,
>> I think you need to point it out and give your feedback to
>> contributers as a maintainer.
>> There was some cases I often missed to review with busy work but I
>> don't ignore contributor's patch.
> 
> I will admit that ignoring the patch in this instance may not have been
> the best course of action. But this particular instance was making it
> exceptionally difficult for me, which is why I was going to shunt this
> until the next cycle so that I could focus on getting the less tiresome
> patches in.
> 
> And interestingly nobody seems to care about this current discussion
> either. So yesterday somebody requested another change to the DT binding
> after this discussion had started, and after I had NAK'ed the patch, but
> then I see that today there's yet another revision with no attempt to do
> anything about the concerns that I had raised.
> 
>> That was why I tried to pick this patch up to my tree to induce your
>> feedback.
>>
>> You mentioned like below,
>> "This patch has gone through 8 revisions within 4 weeks, and I tend to
>> ignore patches like that until the dust settles."
> 
> Yes, two or three of those weeks were during a Christmas break and while
> the merge window was open. Sometimes maintainers do need time to
> recharge.
> 
>> Yes, it's been over a month since contributor sent this patch, and
>> even he requested ping~~~ but there was no comment from you.
>> You say "I tend to ignore patches like that until the dust settles."
> 
> And I did look at the patch after seeing the ping, but I immediately got
> frustrated because it repeats the same mistakes that I had been
> complaining about, and evidently had been too lax about, when the other
> two Samsung drivers got merged. And I do remember some of the names that
> were involved previously, so I think it's fair to assume that you knew I
> wasn't happy about it, and yet you keep sending the same crappy code.

I think we hadn't reached any conclusion for futher specified TODO.

And below thing Andrzej H. mentioned is all which making you to complain? 
https://lkml.org/lkml/2017/1/31/353

> 
>> I'd like to say *maintainer is really not a place for power*, and
>> maintainer would implicitly have a role to encourage in contribution
>> activity of contributer.
> 
> Those are two orthogonal issues. Of course maintainership is about
> power, because otherwise how is a maintainer different from a regular
> contributor?
> 
> And I do encourage contributions, as long as they are worthy. I did go
> through the trouble of explaining the last few times why I think these
> drivers aren't good enough, but I'm not very motivated to do it once
> more because I did try and be encouraging in the past, and did accept
> patches because I thought somebody would eventually come around and do
> things better with the next submission. But I was proven wrong. If you

Please, do not expect all other contributors know and understand this. Especially, what you talked about in the past would be an unknown fact to new people.
And please, do encourage contributions from people who may post really ugly things you think. If you ignore or don't encourage them, then the community will stop growing.

Seems you want to have only the maintainer's role as a technical leader.

I think you already know below Daniel's blog,
http://blog.ffwll.ch/2017/01/maintainers-dont-scale.html

I realized other maintainers had been contemplating this - maintainer's role - for a long time.
I'd like to recommend you to read *It's About the People* chapter.

Thank someone for sharing this. :)

> don't care about addressing the issues I bring up during review, I can
> not be expected to care about your patch submissions any longer.

Again. That is what Andrzej H. mentioned?
https://lkml.org/lkml/2017/1/31/353

Or is there other thing I don't know?

> 
>> And you are continuing reply to other maintainer's comments but no
>> comment to the contributor. This guy would still be ping~. :)
> 
> I fully expect contributors to read all of the comments that are made in
> response to their submission. If they can't be bothered to follow the
> discussion that ensues from their contributions, why should I bother
> looking at their patches?
> 
>> You said you've repeatedly complained but how new contributors know this?
>>
>> And you also said,
>> "DRM panel is somewhat different from core DRM in this regard because
>> its infrastructure is minimal and there's little outside the
>> panel-simple driver. So we're still at a stage where we need to
>> fine-tune what drivers should look like and how we can improve"
>>
>> Please, move panel directory to drivers/staging so that other
>> contributors aren't confused. I think drm-panel should be stayed in
>> staging yet until the things you mentioned will be improved because
>> while being discussed and improved, other contributors will continue
>> their contributions.
> 
> You're twisting my words. I'm not saying that the DRM panel framework
> should be in staging. What I am saying is that we have only a handful of
> drivers, and most people find that panel-simple is a suitable one. And I
> think it works great for those cases.

I know this, and yes, maybe it can definitely reduce much code and it works well but I think this couldn't cover everything.
Display panel device have many functions by vendor. I.e., Color tone change, Outdoor mode, and so on.

And seems that you didn't reached the agreement enough with other people at least.

Thierry, if you continue to insist on this and block other contributions, you may become a diminisher than becoming a multiplier.

Thanks,
Inki Dae

> 
> But the other more complicated drivers are a new thing, so we don't have
> anything like best practices yet. But when I look at the current patches
> as well as the existing Samsung panel drivers that it no doubt was
> inspired by, I realize this is not at all something I consider a good
> example of how such drivers should be written. So we're going to have to
> find ways to improve this before I'm going to accept this patch.
> 
> Thierry
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
