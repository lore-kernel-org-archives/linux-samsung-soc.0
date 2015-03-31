From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 1/2] drivers/rtc/rtc-s3c.c: Integrate Exynos3250 into
 S3C6410
Date: Tue, 31 Mar 2015 10:20:52 +0200
Message-ID: <20150331082052.GI3849@piout.net>
References: <1427728773-29065-1-git-send-email-k.kozlowski@samsung.com>
 <1427728773-29065-2-git-send-email-k.kozlowski@samsung.com>
 <20150331002709.GF3849@piout.net>
 <CABxcv==+h8R-tL9D5OXmYsuYfs_cLATViZ3N1veZwZBZF=fu0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABxcv==+h8R-tL9D5OXmYsuYfs_cLATViZ3N1veZwZBZF=fu0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Chanwoo Choi <cw00.choi@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, rtc-linux@googlegroups.com, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 31/03/2015 at 08:49:39 +0200, Javier Martinez Canillas wrote :
> Hello Alexandre,
> 
> On Tue, Mar 31, 2015 at 2:27 AM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> > nitpick: I would prefer rtc: rtc-s3c instead of drivers/rtc/rtc-s3c.c
> >
> 
> Yes but Krzysztof is following the convention used in drivers/rtc/
> which I think is the correct thing to do even when it's different from
> what is used all over the kernel.
> 

Having a look at the git history, the first and most used prefix is
actually 'rtc:' at some point, this started to change to 'drivers/rtc/'.
We should probably start to get back to 'rtc:', like most subsystems.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
