From: Nick Dyer <nick.dyer@itdev.co.uk>
Subject: Re: [PATCH] Input: atmel_mxt_ts: Add of node type to the i2c table
Date: Tue, 09 Sep 2014 13:36:27 +0100
Message-ID: <540EF44B.4070907@itdev.co.uk>
References: <1410249158-18192-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1410249158-18192-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-input-owner@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/09/14 08:52, Sjoerd Simons wrote:
> For i2c devices in OF the modalias exposed to userspace is i2c:<node
> type>, for the Maxtouch driver this is i2c:maxtouch.
> 
> Add maxtouch to the i2c id table such that userspace can correctly
> load the module for the device and drop the OF table as it's not
> needed for i2c devices.
> 
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

I've tested this and it does work. In fact, it seems that you can use
	compatible = "i2c:atmel,maxtouch";

because the "atmel," is ignored in the matching.

Before I could ack this patch, we will need to update this dts file:
	arch/arm/boot/dts/s5pv210-goni.dts
and this documentation file:
	Documentation/devicetree/bindings/input/atmel,maxtouch.txt

thanks!
