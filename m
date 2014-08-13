From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 6/6] ARM: dts: Add tps65090 FETs constraints
Date: Wed, 13 Aug 2014 18:58:45 +0200
Message-ID: <53EB9945.1020704@collabora.co.uk>
References: <1407861868-20097-1-git-send-email-javier.martinez@collabora.co.uk> <1407861868-20097-7-git-send-email-javier.martinez@collabora.co.uk> <20140812172552.GU17528@sirena.org.uk> <53EA61B9.2070805@collabora.co.uk> <20140812212757.GY17528@sirena.org.uk> <53EB4CA0.3010006@collabora.co.uk> <20140813122910.GQ17528@sirena.org.uk> <53EB6954.3040207@collabora.co.uk> <20140813155122.GX17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140813155122.GX17528@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Mark,

On 08/13/2014 05:51 PM, Mark Brown wrote:
> On Wed, Aug 13, 2014 at 03:34:12PM +0200, Javier Martinez Canillas wrote:
> 
>> Indeed. I'll change mmc_regulator_get_ocrmask() in MMC core then to use
>> regulator_can_change_voltage() to detect if the regulator is a fixed one
>> and call regulator_get_voltage() instead of list_voltage() in that case.
> 
>> Do you agree that this is the correct solution?
> 
> I would just fall back to get_voltage() if there are no voltages listed,
> that seems more robust.
> 

Great, thanks a lot for your suggestion and all the help.

Best regards,
Javier
