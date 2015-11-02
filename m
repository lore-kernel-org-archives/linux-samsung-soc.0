From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v5 4/4] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Mon, 2 Nov 2015 01:47:22 +0100
Message-ID: <20151102004722.GI22331@piout.net>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
 <1446186334-16510-5-git-send-email-alim.akhtar@samsung.com>
 <20151101174048.GD22331@piout.net>
 <5636A44D.4090908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5636A44D.4090908@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, lee.jones@linaro.org, broonie@kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/11/2015 at 08:46:21 +0900, Krzysztof Kozlowski wrote :
> On 02.11.2015 02:40, Alexandre Belloni wrote:
> > On 30/10/2015 at 11:55:34 +0530, Alim Akhtar wrote :
> >> RTC found in s2mps15 is almost same as one found on s2mps13
> >> with few differences in RTC_UPDATE register fields, like:
> >> 1> Bit[4] and Bit[1] are reversed
> >>    - On s2mps13
> >>           WUDR -> bit[4], AUDR -> bit[1]
> >>    - On s2mps15
> >> 	  WUDR -> bit[1], AUDR -> bit[4]
> >> 2> In case of s2mps13, for alarm register, need to set both
> >>    WDUR and ADUR high, whereas for s2mps15 only set AUDR to high.
> >> 3> On s2mps15, WUDR, RUDR and AUDR functions should never be used
> >>    at the same time.
> >>
> >> This patch add required changes to enable s2mps15 rtc timer.
> >>
> >> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> >> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> >> ---
> >>  drivers/rtc/rtc-s5m.c           |   37 +++++++++++++++++++++++++++++++++----
> >>  include/linux/mfd/samsung/rtc.h |    2 ++
> >>  2 files changed, 35 insertions(+), 4 deletions(-)
> >>
> > Applied after fixing the small alignment issue, thanks.
> > 
> 
> I think you cannot apply it directly because it depends on headers from
> patch 2/4. It won't build.
> 

Yeah, this depends on the mfd tree. I don't thin Lee applied patch 2/4
yet so I'm taking that one for 4.5.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
