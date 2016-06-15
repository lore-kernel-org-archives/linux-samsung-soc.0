From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/5] clk: Combine DT binding doc for max77686 and max77802
Date: Wed, 15 Jun 2016 11:19:02 -0400
Message-ID: <a9a4bf3b-7ece-f92f-9d49-d4745f512e3c@osg.samsung.com>
References: <1466000018-16784-1-git-send-email-ldewangan@nvidia.com>
 <1466000018-16784-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466000018-16784-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, k.kozlowski@samsung.com, mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Laxman,

On 06/15/2016 10:13 AM, Laxman Dewangan wrote:
> The clock driver for Maxim PMICs max77686 and max77802 are
> combined into single file to extend the support for same clock
> IP for different PMICs.
>

The DT binding docs shouldn't neither refer to drivers nor map the file
structure of the Linux drivers. That's just an implementation detail of
Linux and it could be different in other operating systems, the binding
should only describe the hardware.

So the commit message should explain the benefits of merging the two DT
bindings docs without mentioning the Linux driver implementation.
 
> Remove the separate DT binding document file for maxim,max77802 and
> move all information to maxim,max77686 DT binding document.
> 

Now, I wonder if this is the correct approach. A system integrator is
probably going to search for the bindings of the chip that is present
in their system. For example there are different DT bindings docs for
both the max77686 and max77802 PMIC even when support is implemented
by the same driver (drivers/mfd/max77686.c).

But maybe I'm wrong so I'll let people with more DT experience to say
if merging the bindings docs in a single one is the correct approach.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
