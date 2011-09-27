From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: RE: [PATCH] mmc: dw_mmc: Support predefined multiple block transfers.
Date: Tue, 27 Sep 2011 11:12:43 +0900
Message-ID: <001f01cc7cba$f1238560$d36a9020$%jun@samsung.com>
References: <001901cc7c42$00147c10$003d7430$%jun@samsung.com>
 <992253991.685205.1317054932934.JavaMail.root@zimbra-prod-mbox-2.vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-mmc-owner@vger.kernel.org>
In-reply-to: <992253991.685205.1317054932934.JavaMail.root@zimbra-prod-mbox-2.vmware.com>
Content-language: ko
Sender: linux-mmc-owner@vger.kernel.org
To: 'Andrei Warkentin' <awarkentin@vmware.com>
Cc: 'Chris Ball' <cjb@laptop.org>, linux-samsung-soc@vger.kernel.org, 'kgene kim' <kgene.kim@samsung.com>, 'dh han' <dh.han@samsung.com>, linux-mmc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Andrei Warkentin wrote:
> Hi Seungwon,
> 
> ----- Original Message -----
> > From: "Seungwon Jeon" <tgih.jun@samsung.com>
> > To: linux-mmc@vger.kernel.org
> > Cc: "Chris Ball" <cjb@laptop.org>, linux-samsung-soc@vger.kernel.org,
> "kgene kim" <kgene.kim@samsung.com>, "dh han"
> > <dh.han@samsung.com>, "Seungwon Jeon" <tgih.jun@samsung.com>
> > Sent: Monday, September 26, 2011 7:46:59 AM
> > Subject: [PATCH] mmc: dw_mmc: Support predefined multiple block
> transfers.
> >
> > This patch adds the support for predefined multiple block read/write.
> >
> > Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
> 
> Without knowing much about dw_mmc host, your logic otherwise looks ok,
> given what
> I've previously done for SDHCI as far as CMD23/Auto-CMD23 enhancement.
> Just curious, what eMMC cards did you test this on, and what improvement
> did you see?

Thank you for review.
As you done, predefined transfer is required for reliable writes and eMMC4.5 feature.
Sadly, I didn't gain an improvement in my case.
(I don't know whether I can clarify the tested eMMC card, just one sample.)

Best regards,
Seungwon Jeon.

> 
> Acked-by: Andrei Warkentin <andrey.warkentin@gmail.com>
> 
> Thanks,
> A
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

