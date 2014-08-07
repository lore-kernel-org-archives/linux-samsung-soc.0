From: Nick Dyer <nick.dyer@itdev.co.uk>
Subject: Re: [PATCH 1/2] Input: atmel_mxt_ts - Get IRQ edge/level flags on
 DT booting
Date: Thu, 07 Aug 2014 13:20:53 +0100
Message-ID: <53E36F25.4030501@itdev.co.uk>
References: <1407372486-25881-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1407372486-25881-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-input-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Warren <swarren@nvidia.com>, Yufeng Shen <miletus@chromium.org>, Benson Leung <bleung@chromium.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/08/14 01:48, Javier Martinez Canillas wrote:
> The Atmel maXTouch driver assumed that the IRQ type flags will
> always be passed using platform data but this is not true when
> booting using Device Trees. In these setups the interrupt type
> was ignored by the driver when requesting an IRQ.
> 
> This means that it will fail if a machine specified other type
> than IRQ_TYPE_NONE. The right approach is to get the IRQ flags
> that was parsed by OF from the "interrupt" Device Tree propery.

I do not believe you are correct about this. There is a bit of code here:
http://lxr.free-electrons.com/source/kernel/irq/manage.c?v=3.16#L1172
which means that in the device tree case, if we call request_threaded_irq()
with no trigger bits set, it will trust whatever it already there. I did
test this back in July and it appeared to work correctly.

Have you tested this change is actually necessary?
