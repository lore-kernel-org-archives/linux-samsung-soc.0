From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Fix the parse_dt of exynos dsi and remove the OF graph
Date: Tue, 21 Feb 2017 08:59:19 +0200
Message-ID: <CAJKOXPcHy=5B2eyQ_7hwDdx8QNnANo8qio4KtY-4s6h6WoYYVQ@mail.gmail.com>
References: <CGME20170209012715epcas1p3dbe1788b864c50d339dcfd791c0900ec@epcas1p3.samsung.com>
 <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
 <58AA95C1.4020809@samsung.com> <CAJKOXPd7Roubdf_5B6pT1PkA9K9dZmjPydYOujXvrz8cVcKVmg@mail.gmail.com>
 <58AAA996.3080900@samsung.com> <CAJKOXPdqfZ6HG9OKiV9xFw1ybSZXKfGPQJdwdVyH-jjeizpUaw@mail.gmail.com>
 <58AB7AC4.40606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58AB7AC4.40606-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 21, 2017 at 1:24 AM, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> Ideally you are right. DT changes should be no any dependency of driver changes but now Exynos DT is broken.
>>
>> I didn't receive any bug reports that Exynos DT is broken so I am
>> quite surprised hearing that. What do you mean by that?
>
> Wrong usage of Display relevant DT ABI is being fixed without the backward compatibility of the DT ABI. This means device driver doesn't consider old DT binding.
> So the use of old DTB binary will make kernel booting not to work correctly.

First you wrote that Exynos DT ABI is broken. Now you mention that
wrong usage is being fixed and old DTB will not be supported. I really
don't get what was your idea. Either something is broken or not. This
is not a Shrodinger's cat.

>
>>
>>> So if we have to keep the bisectability between driver and device tree patches - this means that all drivers should always keep the backward compatibility - then the drivers will be messed up.
>>
>> No, you are mixing two things. Bisectability is different than
>> backward compatibility. For the backward DT ABI compatibility, we
>> agreed that in this case it can be dropped. However bisectability is
>> something totally different. The DTS changes always go through
>> separate branch, so the driver has to be *always* ready for such case
>> and should still be fully bisectable. This is a general rule existing
>
> I meant that if this patch series considers old DT binding to keep the bisectability, then this driver would be messed up because the driver should try to bind same properties at different places and one of these two cases should be bound.
> So this driver doesn't consider the old DT binding, which means that the old DTB binary isn't compatible with this driver - exynos_drm_dsi.c.

Which is wrong. The driver breaks bisectability on first commit.

Let me put it simple:
1. First commit breaks all existing in-kernel DTS. When someone tries
such commit during bisect, he will see some kind of failure. This
means that bisectability is broken on first commit, regardless whether
the rest of patches is on the same branch or not.

2. If the DTS are applied directly after first commit, the
bisectability breakage gap is one-commit wide.

3. DTS commits go to different tree and different branch. This is a
general rule. This means that bisectability breakage gap will be much
wider, span over different trees and branches. This is bad. Bad by
design.

4. Overall: these patches will break bisectability *always*. How big
the breakage will be, depends on way of applying.

5. My merge window was closed some weeks ago. I sent an private email
to Samsung folks, *including you*, on 24th of Jan reminding about
arm-soc merge cycle and that it will close soon. You did not respond.
Yesterday, v4.10 was released which opens Linus' merge window and now
you want to apply these commits. The worst possible timing.
Irresponsible.

So let me put it straight. Please fix the first commit so it will not
break bisectability.

> This means if only one side is merged then this driver wouldn't work correctly.
>
>> for long time and every deviation from the rule is pointed out by
>> arm-soc guys. Whenever I accepted breaking of this rule, I had hard
>> times with arm-soc so no - I am no longer giving up basic rule just
>> because developer might not care.
>
> Understood and reasonable. Seems I just hurried up. For the bisectability, this driver will have a little messed up code temporarily, and this messed up code will be removed after dt change is merged.

Not necessarily. Maybe this can be made in a smart way. I believed
that no one cared to keep it reasonable and that is a problem.

> This thing was really what I want to avoid - if even the messed up code should be keeped forever for the backward compatibility then it would be really terribble. :(

Again you are mixing DT ABI backward compatibility with bisectability.
There is no point of explaining this again...

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
