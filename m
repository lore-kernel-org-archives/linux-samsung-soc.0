From: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH 1/2] ARM: dts: Enable USB 3503 hub on exynos5250-snow
Date: Wed, 28 May 2014 15:37:23 -0700
Message-ID: <CAODwPW8FpsF6vo5Z8_+YXwchwab=7Ltv0nEvP_=907HK232xCg@mail.gmail.com>
References: <1399293056-17143-1-git-send-email-gautam.vivek@samsung.com>
	<536BA9E8.2030306@suse.de>
	<536BAD05.9070401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <536BAD05.9070401@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Vivek Gautam <gautam.vivek@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, arunkk.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

We originally tried using this driver on ChromiumOS and never got it
to work reliably. IIRC the issue was that if the hub had already been
initialized by firmware, the USB stack might enumerate it before the
usb3503 driver is probed and then the later reset will silently
disrupt that connection. (I think I tried to force the 3503 to probe
earlier as well, and there was some other issue with that although I
don't recall the details.)

This will not be an issue for the Snow and Peach_Pi(t) boards (since
neither of them shipped with firmware that supports this hub), but it
will be an issue for Spring and Skate. On ChromiumOS we decided to
carry a local (and admittedly ugly) patch to pull that reset line from
the USB PHY driver instead, since that's the only way I could get it
to work in all cases (see http://crosreview.com/58963).

This doesn't mean I'm against this patch per se, just wanted to point
out the trade-offs.
