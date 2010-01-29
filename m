From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCHv2 05/10] ASoC: AC97: SMDK: Add wm9713 machine
	driver
Date: Fri, 29 Jan 2010 10:08:04 +0900
Message-ID: <1b68c6791001281708ve324caaoa52581e3ebce09bd@mail.gmail.com>
References: <1264571959-15115-1-git-send-email-jassisinghbrar@gmail.com>
	 <20100128120020.GA19270@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:47692 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756033Ab0A2BII convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 20:08:08 -0500
Received: by vws12 with SMTP id 12so369876vws.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jan 2010 17:08:04 -0800 (PST)
In-Reply-To: <20100128120020.GA19270@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Thu, Jan 28, 2010 at 9:00 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Jan 27, 2010 at 02:59:19PM +0900, jassisinghbrar@gmail.com wr=
ote:
>
>> + =C2=A0 =C2=A0 Headphone Playback Switch - On
>> + =C2=A0 =C2=A0 $ amixer cset numid=3D4 1
>> +
>
> Actually, one thing that really needs fixing here - these instruction=
s
> refer to the controls by number. =C2=A0This is extremely fragile in t=
he face
> of any changes in the CODEC driver since the control numbering is wor=
ked
> out at runtime and any change in the set of controls exported by the
> device may change the result. =C2=A0It is much better to refer to the
> controls by name since the names are much less likely to change. =C2=A0=
This
> is also helpful for people using other UIs which don't display the
> control names.
I will submit a patch for it, though I used exact control names and the=
ir
values before every command.
