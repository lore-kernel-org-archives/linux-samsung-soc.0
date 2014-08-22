From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 0/5] usb: phy: samsung: remove old USB PHY code
Date: Fri, 22 Aug 2014 19:14:11 +0200
Message-ID: <9785858.kcvmMFDl1x@amdc1032>
References: <1408026327-31437-1-git-send-email-b.zolnierkie@samsung.com>
 <20140820181244.GX24500@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140820181244.GX24500@saruman.home>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Mark Brown <broonie@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Wednesday, August 20, 2014 01:12:44 PM Felipe Balbi wrote:
> Hi,
> 
> On Thu, Aug 14, 2014 at 04:25:22PM +0200, Bartlomiej Zolnierkiewicz wrote:
> > Hi,
> > 
> > This patch series removes the old Samsung USB PHY drivers that
> > got replaced by the new ones using the generic PHY layer.
> > 
> > Depends on:
> > - next-20140813 branch of linux-next kernel
> 
> this thread seems to have died, what do I need to do with these patches?

Please apply them (patches #3, #4 and #5).  Patches #1 and #2
should be applied (or Acked-by) by Kukjin Kim.

> Are we deleting the phy drivers or not ?

Yes, we are deleting them.  It has been agreed on by Kishon and
Vivek.

> Please rebase on v3.17-rc1 and resend with all Acks in place.

Done:

	https://lkml.org/lkml/2014/8/22/446

Please note that if you want to apply it to current -next kernel
(next-20140822) then you need to resolve conflict between patch
#5/5 ("usb: phy: samsung: remove old common USB PHY code") and
commit bbc66e140bab ("usb: phy: samsung: Fix wrong bit mask for
PHYPARAM1_PCS_TXDEEMPH") by simply removing the new version of
drivers/usb/phy/phy-samsung-usb.h file.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
