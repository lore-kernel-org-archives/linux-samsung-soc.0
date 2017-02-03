From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Fri, 03 Feb 2017 09:54:42 +0100
Message-ID: <74940581-911f-ecdb-e503-6ec2ef8a5177@samsung.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <e72546f1-bd3c-ac0b-9e94-352942293ff9@samsung.com>
 <20170202175817.GC9055@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170202175817.GC9055-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

Finally something technical :)

On 02.02.2017 18:58, Thierry Reding wrote:
> On Tue, Jan 31, 2017 at 01:05:20PM +0100, Andrzej Hajda wrote:
>> On 31.01.2017 09:54, Thierry Reding wrote:
>>> On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
>>>> 2017년 01월 24일 10:50에 Hoegeun Kwon 이(가) 쓴 글:
>>>>> Dear Thierry,
>>>>>
>>>>> Could you please review this patch?
>>>> Thierry, I think this patch has been reviewed enough but no comment
>>>> from you. Seems you are busy. I will pick up this.
>>> Sorry, but that's not how it works. This patch has gone through 8
>>> revisions within 4 weeks, and I tend to ignore patches like that until
>>> the dust settles.
>>>
>>> Other than that, this continues the same madness that I've repeatedly
>>> complained about in the past. The whole mechanism of running through a
>>> series of writes and not caring about errors until the very end is
>>> something we've discussed at length in the past. 
>> Yes, we have discussed the pattern, but without any conclusion. The
>> pattern is correct, used in different places in kernel (see below for
>> examples) and significantly decreases source code size. Disallowing it
>> in panels subsystem just because of personal preferences of the
>> maintainer does not seem to be proper.
>>
>>> It also in large parts
>>> duplicates a bunch of functions from other Samsung panel drivers that I
>>> already said should eventually be moved to something saner.
>> Currently there are two Samsung panel drivers, one is on SPI bus,
>> another one is on DSI.
>> I am (co-)author of both drivers, they have some similarities but I did
>> not see any gain in making additional abstractions over transport layer
>> just to make one or two small functions common.
>> Could you be more precise what are you talking about, or could you give
>> a link to the mail where you said it. Anything I remember was a
>> discussion about ugly magic initialization sequences due to poor
>> documentation.
>>
>> And below promised examples of the error pattern, it was time consuming
>> to find them, so please at least read them :)
> I've done better, below is what I hope a list of good arguments why the
> pattern is a bad idea, and why in some cases it can be justified.
>
>> Almost exactly the same patterns for the same purpose:
>>
>> 1. http://lxr.free-electrons.com/source/drivers/net/ieee802154/atusb.c#L63
>>     Citation from the code:
>>     To reduce the number of error checks in the code, we record the
>> first error
>>     in atusb->err and reject all subsequent requests until the error is
>> cleared.
> That's about the worst example you could've used. Have you even looked
> at the code that uses this? It's completely crazy. So here we have the
> atusb_control_msg() function that stores this error, but then also
> propagates it to its caller. One of these callers is atusb_read_reg(),
> which also propagates the error or returns the register value if the
> read was successful.
>
> Now the really insane part is how this is then used in something like
> atusb_write_subreg():
>
> 	orig = atusb_read_reg(atusb, reg);
> 	tmp = orig & ~mask;
> 	tmp |= (value << shift) & mask;
> 	
> 	if (tmp != orig)
> 		ret = atusb_write_reg(atusb, reg, tmp);
>
> So let's assume that atusb_control_msg() fails in the call to
> atusb_read_reg(). You'll be returning an error code, mask out some bits,
> OR in new ones and write the result to the register. So not only does
> the code not bother to check for errors, but it will also happily go and
> corrupt registers when an error has occurred while reading.

Not true, in case of error in atusb_read_reg atusb_write_reg will do
nothing because atusb->err is set !
And this is strong point of the idiom - you will not be able to perform
transfer until the error is explicitly cleared.
With this idiom it is enough to put guards only in one/two/few places,
in traditional error handling you just need to put checks after every
function call and it is quite common situation that developers forgot to
do that, for example look at mipi calls here [1] :)
[1]:
http://lxr.free-electrons.com/source/drivers/gpu/drm/i915/intel_dsi_panel_vbt.c#L160

So the function is correct, but to avoid fooling unaware readers I would
add error checking after read:

    orig = atusb_read_reg(atusb, reg);
    if (atusb->err)
        return err;


>> 2. http://lxr.free-electrons.com/source/drivers/md/dm-thin.c?v=4.4#L917
> This is completely different from the panel driver because it's used to
> store a value from within callbacks that can't return one.

This is internal framework of the driver, so nothing prevents developer
from implementing callbacks that return value.
Apparently storing error in the object(struct dm_thin_new_mapping) is
good and convenient  :)

>
>> 3. http://lxr.free-electrons.com/source/net/9p/trans_fd.c?v=3.18#L297
> Essentially the same thing.

The same here.

>
>> 4.
>> http://lxr.free-electrons.com/source/drivers/media/v4l2-core/v4l2-ctrls.c#L2234
> Looks like this could be replaced by the more idiomatic use of ERR_PTR()
> encoding error codes. But the most significant difference here is that
> each use of the handler_set_err() function is followed by a return. So
> instead of ignoring errors like you do in the panel drivers, this does
> recognize them and aborts early, rather than trying to go through the
> remainder of the code, irrespective of how small the chances are of it
> succeeding. Or ignoring that /even if/ the remainder didn't fail, the
> one operation that fail might have been essential to the operation of
> the device.

I have an impression that you do not understand the idiom. It does not
allow to ignore error - as soon as the error is detected, guard is set
and no further harm can be done.
Going back to V4L2, look at the usage of the idiom [2]:
                 v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_gen, NULL);
                 v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_vid, NULL);
                 v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_aud, NULL);
                 v4l2_ctrl_add_handler(hdl_vid_cap, hdl_streaming, NULL);
                 v4l2_ctrl_add_handler(hdl_vid_cap, hdl_sdtv_cap, NULL);
                 v4l2_ctrl_add_handler(hdl_vid_cap, hdl_loop_cap, NULL);
                 if (hdl_vid_cap->error)
                         return hdl_vid_cap->error;

Again, the point is you do not need to use old construct, which enlarges
the code about three times:
    err = func(obj,...);
    if (err < 0)
        return err;

Instead you just call func(obj,...), and the burden of error checking is
put into the function, but for this err must be stored in object.

[2]:
http://lxr.free-electrons.com/source/drivers/media/platform/vivid/vivid-ctrls.c#L1630

>
>> 5. http://lxr.free-electrons.com/source/drivers/media/i2c/s5k5baf.c#L451
> That's a particularly good example of why you shouldn't be doing this
> kind of thing. Consider what would happen in these cases if for example
> there was a problem with the I2C interface. There's a bunch of read and
> write sequences in that driver that go completely without checking for
> errors. 

Not true, no further transfer will be performed.

> Imagine how that will look to a user when the communication to a
> chip doesn't work. They'll get a load of error messages all saying that
> communication timed out, or that the slave isn't responding or what not.
> And worse still, for timeouts you're also going to introduce a bunch of
> error messages interleaved with potentially other useful messages from
> other drivers or the core. Depending on the number of access you have it
> might take seconds for all of the error messages to drain before you
> notice somewhere at the end of the code that something went wrong and
> decide to abort whatever you were trying to do.

Again, not true at all.

>
>>     This is my driver, I mention it here just to show it was not a
>> problem to merge it to media subsystem.
> That just shows what everybody knows: that maintainers care about
> different things at different levels.
>
>> Similar patterns:
>>
>> 6. http://lxr.free-electrons.com/source/fs/seq_file.c#L398
>>     Do not process object if buffer is full, it allows to do not check
>> buffer size after every write, for example:
>>>     seq_printf(m, " hardirq-safe locks:            %11lu\n",
>>>             nr_hardirq_safe);
>>>     seq_printf(m, " hardirq-unsafe locks:          %11lu\n",
>>>             nr_hardirq_unsafe);
>>>     seq_printf(m, " softirq-safe locks:            %11lu\n",
>>>             nr_softirq_safe);
>>>     seq_printf(m, " softirq-unsafe locks:          %11lu\n",
>>>             nr_softirq_unsafe);
>>>     seq_printf(m, " irq-safe locks:                %11lu\n",
>>>             nr_irq_safe);
>>>     seq_printf(m, " irq-unsafe locks:              %11lu\n",
>>>             nr_irq_unsafe);
>>>
>>>     seq_printf(m, " hardirq-read-safe locks:       %11lu\n",
>>>             nr_hardirq_read_safe);
>>>     seq_printf(m, " hardirq-read-unsafe locks:     %11lu\n",
>>>             nr_hardirq_read_unsafe);
>>>     seq_printf(m, " softirq-read-safe locks:       %11lu\n",
>>>             nr_softirq_read_safe);
>>>     seq_printf(m, " softirq-read-unsafe locks:     %11lu\n",
>>>             nr_softirq_read_unsafe);
>>>     seq_printf(m, " irq-read-safe locks:           %11lu\n",
>>>             nr_irq_read_safe);
>>>     seq_printf(m, " irq-read-unsafe locks:         %11lu\n",
>>>             nr_irq_read_unsafe);
>>>
>>>     seq_printf(m, " uncategorized locks:           %11lu\n",
>>>             nr_uncategorized);
>>>     seq_printf(m, " unused locks:                  %11lu\n",
>>>             nr_unused);
>>>     seq_printf(m, " max locking depth:             %11u\n",
>>>             max_lockdep_depth);
>> Now try to imagine how it would look like if you add error checking
>> after each call.
> I think that's a fairly sane use-case for this kind of pattern. The big
> difference is that this condition is checked in subsequent accesses to
> shortcut failure paths. It's also very different in that it performs
> writes to memory and those aren't going to fail. The root cause of this
> overflow would be static in nature and likely found doing basic testing
> and fixed by making the buffer larger.
>
> That's contrary to a driver doing I/O (I2C, SPI, DSI, ...) that can fail
> unexpectedly for any number of reasons.

The idiom is still the same - storing error state in the object allows
to move error checking inside called functions, removing much of
redundant code from caller.

>
>> 7. http://lxr.free-electrons.com/source/lib/devres.c#L129
>>     Postponed error check:
>>> */res = platform_get_resource(pdev, IORESOURCE_MEM, 0);/*
>>> /*b*/*/ase = devm_ioremap_resource(&pdev->dev, res);/*
>>> */if (IS_ERR(base))/*
>>> /**/*/return PTR_ERR(base);/*
> Heh, I wrote that =)
>
> This is also quite different from your usage in the panel driver. We do
> not simply ignore failure from platform_get_resource(), instead we leave
> it up to devm_ioremap_resource() to turn it into a meaningful error code
> and message. The function does this very early on, so the error
> condition is not ignored, as it is in the panel driver.

Claims about the panel again not true, reasons described above.

The similarity here is that you do not perform error checking in the
caller, you just blindly pass the 'object' to the next function, and
still everything is handled correctly.

>
> Also doing this helps with providing unified error codes and messages
> across all callers, and removing a lot of boiler plate from drivers that
> previously used to come up with all sorts of meaningless error codes and
> completely inconsistent messages.

I like this pattern and I agree with this reasoning I just want to allow
usage of it more widely, or at least not to block patches using it :)


Regards
Andrzej


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
