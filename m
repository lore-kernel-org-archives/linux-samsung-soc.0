From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [RFC 2/5] ARM: P2V: avoid initializers and assembly using PHYS_OFFSET
Date: Thu, 17 Feb 2011 23:16:43 +0800
Message-ID: <AANLkTinoqNZKU3WSRf7cXG-CtpjptWhLY8c7P_z8h8f=@mail.gmail.com>
References: <20110104202052.GE24935@n2100.arm.linux.org.uk> <E1PaDOv-00023d-Gi@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <E1PaDOv-00023d-Gi@rmk-PC.arm.linux.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Nicolas Pitre <nico@fluxnic.net>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@codeaurora.org>, Bryan Huntsman <bryanh@codeaurora.org>, Amit Kucheria <amit.kucheria@canonical.com>, Sascha Hauer <kernel@pengutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, "Hans J. Koch" <hjk@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 5, 2011 at 4:22 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> As PHYS_OFFSET will be becoming a variable, we can't have it used in
> initializers nor assembly code. =C2=A0Replace those in generic code w=
ith
> a run-time initialization. =C2=A0Replace those in platform code using=
 the
> individual platform specific PLAT_PHYS_OFFSET.
>
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Acked-by: Eric Miao <eric.y.miao@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-arm-msm=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
