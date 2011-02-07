From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [RFC 2/5] ARM: P2V: avoid initializers and assembly using
 PHYS_OFFSET
Date: Mon, 7 Feb 2011 17:52:52 +0100
Message-ID: <20110207165252.GH27982@pengutronix.de>
References: <20110104202052.GE24935@n2100.arm.linux.org.uk>
 <E1PaDOv-00023d-Gi@rmk-PC.arm.linux.org.uk>
 <20110207165150.GG27982@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110207165150.GG27982@pengutronix.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Nicolas Pitre <nico@fluxnic.net>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@codeaurora.org>, Bryan Huntsman <bryanh@codeaurora.org>, Amit Kucheria <amit.kucheria@canonical.com>, Sascha Hauer <kernel@pengutronix.de>, Eric Miao <eric.y.miao@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "Hans J. Koch" <hjk@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello again,

On Mon, Feb 07, 2011 at 05:51:50PM +0100, Uwe Kleine-K=F6nig wrote:
> nack.  7608d7d2b4a146f560436f5b99b1b93d30049e4e has a better fix.
urgs, this was already pointed out, sorry.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-arm-msm=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
