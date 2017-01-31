From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Tue, 31 Jan 2017 13:30:16 +0200
Message-ID: <CAJKOXPczttCexd4ZGHEFj=4-6a=9t1VsEmovPGmFFYHv1e5ZzQ@mail.gmail.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com> <588FD3C3.7080508@samsung.com>
 <CAJKOXPfB0yuQY2bdTEYegU+eakBw32X80ALJkxB2sUX8xFjy+g@mail.gmail.com>
 <58905A2B.9090101@samsung.com> <CAJKOXPeCF3+YXk-GHmewn6fi0rcPbQ_GoPOeFRP2KYN=6KLLxw@mail.gmail.com>
 <CAAQKjZNN98pah8ht=kSmwsVybA5cMP=Z6BVkfZ6HH-5rRYFQ9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAQKjZNN98pah8ht=kSmwsVybA5cMP=Z6BVkfZ6HH-5rRYFQ9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <daeinki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 31, 2017 at 12:37 PM, Inki Dae <daeinki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2017-01-31 19:01 GMT+09:00 Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Tue, Jan 31, 2017 at 11:34 AM, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>
>>>
>>> 2017년 01월 31일 18:22에 Krzysztof Kozlowski 이(가) 쓴 글:
>>>> On Tue, Jan 31, 2017 at 2:01 AM, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>>
>>>>>
>>>>> 2017년 01월 24일 10:50에 Hoegeun Kwon 이(가) 쓴 글:
>>>>>> Dear Thierry,
>>>>>>
>>>>>> Could you please review this patch?
>>>>>
>>>>> Thierry, I think this patch has been reviewed enough but no comment from you. Seems you are busy. I will pick up this.
>>>>>
>>>>
>>>> Comments from v8 were not resolved and I think we are waiting for v9:
>>>> https://lkml.org/lkml/2017/1/11/178
>>>>
>>>> If that is not correct then please clarify.
>>>
>>> Seems you pointed to change te-gpios bindings to optional. right?
>>>
>>> I thought Rob left ack so it's no problem.
>>> https://lkml.org/lkml/2017/1/13/626
>>
>> Yes, change them to optional. I think it is a problem (regardless of
>> Rob's ack) because you are merging a driver requiring a property which
>> soon you want to remove. If you merge it (like this) removal of
>> te-gpios property will be breakage of ABI. This is not a serious
>> problem but knowing such plan of te-gpios removal upfront, it would be
>> wrong to commit such driver.
>
> This is a trivial thing so it doesn't make breakage of ABI because the
> property, te-gpios, is *optional*.

So why bindings document is not changed?

+Required properties:
(...)
+  - te-gpios: a GPIO spec for the tearing effect synchronization signal
+    gpio pin (active high)

Andrzej pointed this out and it is not fixed since then. What is the
problem with fixing the bindings documentation?

> Anyway, this wouldn't be *the things* Thierry mentioned.

Probably not, I did not respond to Thierry's feedback.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
