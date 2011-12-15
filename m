From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [linux-next] make s5p64x0_defconfig build error
Date: Thu, 15 Dec 2011 09:09:25 +0100
Message-ID: <201112150909.26229.heiko@sntech.de>
References: <1323838630.18517.1.camel@phoenix> <028901ccbab8$c2c43890$484ca9b0$%kim@samsung.com> <CAF+7xWn80ZsgBNS80f0JYUXx2KN3VGM-Y2EOba7OLMwMGNfbKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAF+7xWn80ZsgBNS80f0JYUXx2KN3VGM-Y2EOba7OLMwMGNfbKg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: axel.lin@gmail.com
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Am Donnerstag, 15. Dezember 2011, 00:54:58 schrieb Axel Lin:
> Hi Kukjin,
> 
> > Axel and Will, thanks for pointing out.
> > 
> > Oops, I couldn't have much time to follow up :(
> > But let me look at that in this weekend and I know, it can be escaped
> > before merge window :)
> 
> I also found the same build errors by:
> make s5pc100_defconfig
> make s5pv210_defconfig
> make exynos4_defconfig

make s3c2410_defconfig
also produces the build errors

Heiko
