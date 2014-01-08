From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: USB broken on Exynos 5250 with 3.13-rc6 kernel
Date: Wed, 8 Jan 2014 19:27:14 +0530
Message-ID: <CAFp+6iHk+HmNSfS5sJDKb0A1PLmFbcWuY_Rspf17Wic0x7oxgQ@mail.gmail.com>
References: <736730464.35956872.1388786216775.JavaMail.root@redhat.com>
	<920466999.35957290.1388786401864.JavaMail.root@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f44.google.com ([209.85.214.44]:54943 "EHLO
	mail-bk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756732AbaAHN5P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jan 2014 08:57:15 -0500
Received: by mail-bk0-f44.google.com with SMTP id d7so683730bkh.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jan 2014 05:57:14 -0800 (PST)
In-Reply-To: <920466999.35957290.1388786401864.JavaMail.root@redhat.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: John Dulaney <jdulaney@redhat.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Will Cohen <wcohen@redhat.com>, Jonathan Masters <jcm@redhat.com>

Hi John,


On Sat, Jan 4, 2014 at 3:30 AM, John Dulaney <jdulaney@redhat.com> wrote:
> I build 3.13-rc6 for exynso-5250.  After installing the kernel and
> rebooting my machine, everything worked (lpae out of the box, even)
> except for usb; I rebuilt the kernel a couple of times, poking at
> USB config options, but was completely unable to get USB to work.

Which exynos5250 machine are you trying the kernel ?
I tested linux-next kernel 3.13-rc7 on smdk5250, and on that i could
get USB working (i checked XHCI ports actually,
but i am sure EHCI ports will also work straight away).

Please make sure you are building with exynos_defconfig. And on top of
that i enabled following configs:
CONFIG_USB_ANNOUNCE_NEW_DEVICES
CONFIG_USB_XHCI_HCD
CONFIG_USB_EHCI_EXYNOS

CONFIG_USB_OHCI_HCD             (these OHCI configs will serve the
purpose to use HID)
CONFIG_USB_OHCI_EXYNOS

[...]



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
