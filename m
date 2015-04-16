From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 0/8] cros_ec: Add multiple EC and protocol v3 support
Date: Thu, 16 Apr 2015 12:24:14 +0200
Message-ID: <552F8DCE.6080601@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <552F64F7.80908@collabora.co.uk> <2595984.H9vRKj1ZfJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:37532 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964887AbbDPKYV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 06:24:21 -0400
In-Reply-To: <2595984.H9vRKj1ZfJ@diego>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Heiko,

On 04/16/2015 11:49 AM, Heiko St=FCbner wrote:
> Hi Javier,
>=20
> Am Donnerstag, 16. April 2015, 09:29:59 schrieb Javier Martinez Canil=
las:
>> Hello,
>>=20
>> On 04/06/2015 06:14 PM, Javier Martinez Canillas wrote:
>> > Newer Chromebooks have more than one Embedded Controller (EC) in t=
he
>> > system. These additional ECs are connected through I2C with a host=
 EC
>> > which is the one that is connected to the Application Processor (A=
P)
>> > through I2C, SPI or LPC.
>> >=20
>> > So on these platforms, sub-processors are chained to each other:
>> >=20
>> > AP <--> Host EC <--> Power Delivery (PD) EC
>> >=20
>> > The AP sends commands to the additional EC through the host EC usi=
ng
>> > a set of passthru commands and the host redirects to the correct E=
C.
>> >=20
>> > This series adds support for multiple EC in a system and also for =
the
>> > protocol version 3 that is used on newer ECs.
>>=20
>> Any comments about this series? I know that we are in the middle of =
the
>> merge window but it would be great if I can get some feedback to get=
 it
>> ready and re-post for 4.2 (addressing any issue) once 4.1-rc1 is out=
=2E
>>=20
>> > Most patches were taken from the downstream ChromiumOS v3.14 tree =
with
>> > fixes squashed, split to minimise the cross subsystem churn and ch=
anges
>> > for mainline inclusion but were not modified functionality wise.
>> >=20
>> > The series depend on "platform/chrome: Add user-space dev inferfac=
e
>> > support" [0] that is already merged in the chrome-platform tree so
>> > probably these patches should also go through that tree once the m=
fd
>> > patches are acked.
>> >=20
>> > The series is a resend of a patch-set posted a month ago [1]. The =
only big
>>=20
>> As I said, the original patchset was post about a month ago and this=
 re-sent
>> 10 days ago so it would be great to have some feedback on the series=
=2E
>=20
> on a veyron-pinky-rev2, with
> cros-ec-spi spi0.0: using proto v3
> cros-ec-spi spi0.0: no PD chip found: -19
>=20
> Tested-by: Heiko Stuebner <heiko@sntech.de>
>=20

Thanks a lot for testing!

>=20
> with the catch of the device needing two additional patches from the =
Chromeos-
> tree:
>=20
> c7ae1e2ef996 mfd: cros ec: spi: put the delay and send msg in one cyc=
le
> 8558460450c1 mfd: cros ec: spi: Add delay for asserting CS
>=20
> and I'm not sure if they are submitted yet.

Yes, those patches have not been posted yet. The delta for the cros_ec
drivers between the ChromiumOS tree and mainline is still very big but
I've been trying to reduce it with each series.

I was planning to include those in the next series once this one lands.
You can refer to http://crbug.com/391797 for the current status.

>=20
>=20
> Heiko
>=20

Best regards,
Javier
