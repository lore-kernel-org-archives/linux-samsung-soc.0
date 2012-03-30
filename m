From: Rabin Vincent <rabin@rab.in>
Subject: Re: [PATCH v2] video: s3c-fb: Add device tree support
Date: Fri, 30 Mar 2012 21:25:14 +0530
Message-ID: <CAH+eYFCrdtYC+v3tgqsaCS9-Y61JCwA1MLkkPtH14p=JWBbzBw@mail.gmail.com>
References: <1333086797-1625-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:56253 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753190Ab2C3Pzz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Mar 2012 11:55:55 -0400
In-Reply-To: <1333086797-1625-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-fbdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, FlorianSchandinat@gmx.de, jg1.han@samsung.com, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, patches@linaro.org, linux-arm-kernel@lists.infradead.org, agust@denx.de

On Fri, Mar 30, 2012 at 11:23, Thomas Abraham <thomas.abraham@linaro.or=
g> wrote:
> + =A0 =A0- samsung,fimd-display: The fimd controller is interfaced wi=
th the a
> + =A0 =A0 =A0display device such as a lcd panel. This property should=
 specify the
> + =A0 =A0 =A0phandle of the display device node. For a display device=
 node that
> + =A0 =A0 =A0represents a RGB type display interface, it is expected =
to specify the
> + =A0 =A0 =A0video interface timing using the following properties.
> +
> + =A0 =A0 =A0- lcd-htiming: Specifies the horizontal timing for the o=
verlay. The
> + =A0 =A0 =A0 =A0horizontal timing includes four parameters in the fo=
llowing order.
> +
> + =A0 =A0 =A0 =A0- horizontal back porch (in number of lcd clocks)
> + =A0 =A0 =A0 =A0- horizontal front porch (in number of lcd clocks)
> + =A0 =A0 =A0 =A0- hsync pulse width (in number of lcd clocks)
> + =A0 =A0 =A0 =A0- Display panels X resolution.
> +
> + =A0 =A0 =A0- lcd-vtiming: Specifies the vertical timing for the ove=
rlay. The
> + =A0 =A0 =A0 =A0vertical timing includes four parameters in the foll=
owing order.
> +
> + =A0 =A0 =A0 =A0- vertical back porch (in number of lcd lines)
> + =A0 =A0 =A0 =A0- vertical front porch (in number of lcd lines)
> + =A0 =A0 =A0 =A0- vsync pulse width (in number of lcd clocks)
> + =A0 =A0 =A0 =A0- Y resolution.

In this old thread, it was suggested to use a raw EDID block to supply
timings, and since then a couple of drivers in mainline (sm501fb and
fsl-diu) are doing it that way:

http://lists.ozlabs.org/pipermail/linuxppc-dev/2010-February/080683.htm=
l

Shouldn't this driver be doing the same thing?  If not, shouldn't
whatever interface this is adding be provided in a common helper (like
that old patch was trying to add) so it's standardized between drivers?
