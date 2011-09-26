From: Andrei Warkentin <awarkentin@vmware.com>
Subject: Re: [PATCH] mmc: dw_mmc: Support predefined multiple block
 transfers.
Date: Mon, 26 Sep 2011 09:35:33 -0700 (PDT)
Message-ID: <992253991.685205.1317054932934.JavaMail.root@zimbra-prod-mbox-2.vmware.com>
References: <001901cc7c42$00147c10$003d7430$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <001901cc7c42$00147c10$003d7430$%jun@samsung.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>
Cc: Chris Ball <cjb@laptop.org>, linux-samsung-soc@vger.kernel.org, kgene kim <kgene.kim@samsung.com>, dh han <dh.han@samsung.com>, linux-mmc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Seungwon,

----- Original Message -----
> From: "Seungwon Jeon" <tgih.jun@samsung.com>
> To: linux-mmc@vger.kernel.org
> Cc: "Chris Ball" <cjb@laptop.org>, linux-samsung-soc@vger.kernel.org, "kgene kim" <kgene.kim@samsung.com>, "dh han"
> <dh.han@samsung.com>, "Seungwon Jeon" <tgih.jun@samsung.com>
> Sent: Monday, September 26, 2011 7:46:59 AM
> Subject: [PATCH] mmc: dw_mmc: Support predefined multiple block transfers.
> 
> This patch adds the support for predefined multiple block read/write.
> 
> Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>

Without knowing much about dw_mmc host, your logic otherwise looks ok, given what
I've previously done for SDHCI as far as CMD23/Auto-CMD23 enhancement. 
Just curious, what eMMC cards did you test this on, and what improvement did you see?

Acked-by: Andrei Warkentin <andrey.warkentin@gmail.com>

Thanks,
A
