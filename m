From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 1/3] clk: s2mps11: Add support for S2MPS14 clocks
Date: Wed, 19 Mar 2014 08:50:08 +0100
Message-ID: <1395215408.18730.2.camel@AMDC1943>
References: <1395047958-17953-1-git-send-email-k.kozlowski@samsung.com>
 <1395047958-17953-2-git-send-email-k.kozlowski@samsung.com>
 <20140319001643.30995.46947@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140319001643.30995.46947@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 2014-03-18 at 17:16 -0700, Mike Turquette wrote:
> Quoting Krzysztof Kozlowski (2014-03-17 02:19:16)
> > This patch adds support for S2MPS14 PMIC clocks (BT and AP) to the
> > s2mps11 clock driver.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Reviewed-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
> This does not apply cleanly to to clk tree trip, nor does it compile
> after manually merging due to changes introducing
> linux/mfd/samsung/s2mps14.h.
> 
> The changes look OK to me so maybe Lee can take it with my Ack?
> 
> Acked-by: Mike Turquette <mturquette@linaro.org>
> 

Hi,

Thanks for the Ack. The patch depends on Tushar Behera's patches:
 - [PATCH V2 0/2] Add support for clocks in S5M8767
   http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27264
which are waiting for some time. Both patchsets should be pulled
together.

Best regards,
Krzysztof
