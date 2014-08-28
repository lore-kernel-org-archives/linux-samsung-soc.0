From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 11/14] arm64: dts: Add initial device tree support for EXYNOS7
Date: Thu, 28 Aug 2014 12:33:13 -0500
Message-ID: <CAL_JsqKB-gganC6H1XBzUbFzXk8zy08U4X3mFWhxNWZO=upJPQ@mail.gmail.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-3-git-send-email-ch.naveen@samsung.com> <20140828035639.GB4972@localhost>
 <20140828094846.GD14650@leverpostej> <CAOesGMjY8wfAcq2fLgs=ZWHdiWtFqxr+ncUKTje0SnXqO-CCgQ@mail.gmail.com>
 <20140828170306.GQ14650@leverpostej> <53FF6668.4080502@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FF6668.4080502-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 28, 2014 at 12:27 PM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> On 28/08/14 18:03, Mark Rutland wrote:
>
>> From 67104ad5a56e4c18f9c41f06af028b7561740afd Mon Sep 17 00:00:00 2001
>> From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Date: Thu, 28 Aug 2014 17:41:03 +0100
>> Subject: [PATCH] Doc: dt: arch_timer: discourage clock-frequency use
>>
>> The ARM Generic Timer (AKA the architected timer, arm_arch_timer)
>> features a CPU register (CNTFRQ) which firmware is intended to
>> initialize, and non-secure software can read to determine the frequency
>> of the timer. On CPUs with secure state, this register cannot be written
>> from non-secure states.
>>
>> The firmware of early SoCs featuring the timer did not correctly
>> initialize CNTFRQ correctly on all CPUs, requiring the frequency to be
>> described in DT as a workaround. This workaround is not complete however
>> as CNTFRQ is exposed to all software in a privileged non-secure mode,
>> including KVM guests. The firmware and DTs for recent SoCs have followed
>
> I believe Xen is also affected by this.
>
>> the example set by these early SoCs.
>>
>> This patch updates the arch timer binding documentation to make it
>> clearer that the use of the clock-frequency property is a poor
>> work-around. The MMIO generic timer binding is similarly updated, though
>> this is less of a concern as there is generally no need to expose the
>> MMIO timers to guest OSs.
>>
>> Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>
> Short of more explicit threats:

Why not also add WARNs (and mark for stable). People tend to notice
and fix those. If not the vendors, those pesky customers always
complain (the same ones that get concerned about BogoMIPS values being
too low).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
