From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: General comments on current 6440 code
Date: Tue, 10 Nov 2009 21:14:39 +0900
Message-ID: <1b68c6790911100414h2ff16f9coe049dd87eead21ff@mail.gmail.com>
References: <20091110064444.GD4048@prithivi.gnumonks.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:52011 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754942AbZKJMOe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2009 07:14:34 -0500
Received: by pwi3 with SMTP id 3so1255004pwi.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2009 04:14:39 -0800 (PST)
In-Reply-To: <20091110064444.GD4048@prithivi.gnumonks.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Harald Welte <laforge@gnumonks.org>
Cc: thomas.ab@samsung.com, linux-samsung-soc@vger.kernel.org

On Tue, Nov 10, 2009 at 3:44 PM, Harald Welte <laforge@gnumonks.org> wr=
ote:
> * spi: the SPI clock source should be a runtime decision based on the
> =C2=A0platform data. getting the various clocks should happen inside =
the
> =C2=A0driver. =C2=A0Remember: the compiled SPI driver has to work on =
any board,
> =C2=A0and every board might use a different SPI clock source configur=
ation.
> * Also, SPI support should be split into a separate patch

thanks for the feedback. overhauling and submitting SPI driver is next
on my todo list.
I will take care of such things then.
