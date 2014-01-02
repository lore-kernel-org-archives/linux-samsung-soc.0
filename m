From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: S3C24XX: Fix configuration of gpio port sizes on S3C24XX.
Date: Thu, 2 Jan 2014 13:53:02 +0100
Message-ID: <CACRpkdY+aLA6OG3jjgwtLoH=O-SS-W_A5Ps9WZY70ogQN2RySg@mail.gmail.com>
References: <1378889173-7437-1-git-send-email-jose.goncalves@inov.pt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1378889173-7437-1-git-send-email-jose.goncalves@inov.pt>
Sender: linux-gpio-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 11, 2013 at 10:46 AM, Jos=E9 Miguel Gon=E7alves
<jose.goncalves@inov.pt> wrote:

> Some GPIO line limits are incorrectly set which, for instance,
> does not allow nRTS1 (GPH11) configuration on a S3C2416 chip.
>
> Signed-off-by: Jos=E9 Miguel Gon=E7alves <jose.goncalves@inov.pt>

Patch applied with Kukjin's ACK and Heiko's review tag.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
