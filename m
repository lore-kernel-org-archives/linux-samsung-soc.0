From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3] usb: Remove references to non-existent PLAT_S5P symbol
Date: Wed, 05 Nov 2014 11:23:36 +0100
Message-ID: <5459FAA8.1060902@samsung.com>
References: <1412673127-11479-1-git-send-email-s.nawrocki@samsung.com>
 <20141103232438.GA11698@kroah.com> <54591BDF.8060203@samsung.com>
 <1415128864.20372.189.camel@x220> <20141104194221.GB3722@kroah.com>
 <1415130776.20372.194.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1415130776.20372.194.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/11/14 20:52, Paul Bolle wrote:
> On Tue, 2014-11-04 at 11:42 -0800, Greg KH wrote:
>> > As it's something that no one seemed to ever need before (i.e. it's not
>> > a regression fix), but it would be a "new feature", I don't think it's
>> > really a stable fix.
>> > 
>> > But feel free to convince me otherwise :)
>
> Sylwester, was I right in thinking that users of PLAT_S5P, who could set
> USB_EHCI_EXYNOS or USB_OHCI_EXYNOS pre v3.17, got, well, transferred to
> ARCH_S5PV210 and lost the ability to set one of those symbols in v3.17?

Yes, after commit d78c16ccde96 ("ARM: SAMSUNG: Remove remaining legacy code")
we lost the ability to enable USB OHCI and EHCI on S5PV210 SoC.
Thus for those who use the mainline kernel (might be rare) with S5PV210 SoC
there is obviously a regression in USB subsystem in v3.17.


-- 
Regards,
Sylwester
