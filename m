Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1803BFE40
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Aug 2026 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330453; cv=none; b=dtoaEqi3NGxbmRD7VtxAi/gjhchnW2rLPEyuf64gL7RN+ol/vuZke75W2vWzz+EDy4CfjfUk1UIRkz44CygLz1DSDhw32Y0jwYyCtTfGSpSK0YD29a9VpcAr4+MQ6rBYmLu2HjefAbI2zZVPcLAZMVQyknAAIA/y74mBDRwrM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330453; c=relaxed/simple;
	bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRATxE8lzITb8W34gNl4NTsHSdX+5VFK+aFaxbsbgr/jhrjcuvEmh8VNVoNsZKxWl+qEO4JZ10V5e4SrGDHCxx86DnqTE6dQA37LLeSV8OCWTX5AfMDaFvBqevNaO7fijNIbCa5FBhvei5MfgAKFZCbLvRf/HSk4rD1r3IyuD0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cMfr4TWX; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cMfr4TWX"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so735281e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Aug 2026 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787330451; x=1787935251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
        b=cMfr4TWX4yB+BNoj8GPzVxL6MUEu+d9LTDAwo31HuqlDPiWieW2OkFm1WO7YbHVwlf
         eN6t/YDIP+uKsPnNGiljU4p37Wg2TEWa+u4qiIy7M8YcOILxxx6qDS+Krs84Twcs3A8y
         hzPs2sTnsmdQWUiulcO20AHbDfdd4rLyG0oSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787330451; x=1787935251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
        b=A7RYVdva0x/DinSkOMshqUJWA8xuMkDtGvlMy6ZKcWgbJ5W5R1ZCn1yxhOzs/DAlP0
         ZXrIxOvKww1J2mxHewm1sGlDYehXqfLzmeSOiyu9t40G+Z6sMSlDnXuH5WndQZhmqycx
         WPMMzecW7l57dNERc3yJHFUIvrLOkIhHZh8lVaSQn54LDwiGgsXktE5o4vM+x5kFcKh8
         nBWbbp4Wrkw50m3Mk0BshbWuHM1oWo5r1qvuNWcdZSdl+Gf4jNyqw0zRmowe8PdUDY0O
         fZ6M2WQaVAGRdmVC/xLWLNSKp11BLeHuy6XAXtIZ4SCujvFjKy0eos7yQ1OQVGRTsgi4
         WJWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6+Y6mm7RDX1qdXucbzfaFIXTI/RoYJ3OlLcF/R4xua5K77k/IfTuAOMM6FXaj3P5/lJccDCAWy7pm+3gmlWJdhg==@vger.kernel.org
X-Gm-Message-State: AFuF++m0Qo/oDz8UuSPYPr7lVABtD0LnjL4dHTZoSfCuwWN+BL9b1zUY
	JjKE/Epp6uWrgItr6GzeglbswME/cBA7NvUK5f3iKfV7+3ZIM6hX47EdiiC4t7eIdAT6W3O8c7x
	hkCI=
X-Gm-Gg: AR+sD11WF9pMK6WdkWTsE2ltO+PU3oAddXFj86kFC2DzvC9yWN38E9a2vDPnNStpSZu
	obFAlx0AG5u5MBLsV/kN5mvljQL9VtVMVlHrHHESENMp2EuHZIVU9BtkVymlSFg0kPDjLxptgNF
	A0XVfPGWggEVm3F/1wBQMnVoqUaM3DxDru+3ndxjf8E0VECV7n2T28qmiSC9k5eU48WyDNVokPF
	6ZGT3gwnPVI1LvUpyL9h5AWx/WS7h5eO5ha0dVpDqOa/NPLxSNF5i36KEzzBomD7RRUOluzsuqQ
	A3D6ULqKjkG2iq63sJbrNw5u+c1bVJuCEyjrpL3YNC/wcOOM1mBIwClBQ1PHSmPgV+pHTMJgBoV
	/DqVX+httzLannqoi+wSBnQQTj/1tTt9XTaZApNciiRYohopKyhDQIvNSwpG2gFbNWsrLw8xyra
	Oq5cTea7bD1fATvP4YgXxB8pOk5Lwce9kaEpTJDt+cn9NLEgP3dbmq3Wg55jcGEPFf9GSvYf3Tt
	GZv5+/6Rr6/Z81eodzafAwKqIc=
X-Received: by 2002:a05:6122:62a2:b0:5c1:47db:cfcb with SMTP id 71dfb90a1353d-5c60de32ee0mr62463e0c.4.1787330451023;
        Fri, 21 Aug 2026 09:40:51 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e261a3b3sm9620447e0c.7.2026.08.21.09.40.50
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:40:50 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ad03fa605so717162137.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Aug 2026 09:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrUh6VHXMsSq5IaCBGaaCfCYYJlTwojSGBIXS9aILfnERb0FAqG8RpLEoJgaaFQtpe0+xv9Ftt9inHokqFMTmkQag==@vger.kernel.org
X-Received: by 2002:a67:c996:0:b0:77a:9991:5d08 with SMTP id
 ada2fe7eead31-77a9991cec1mr1941674137.9.1787330449569; Fri, 21 Aug 2026
 09:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org> <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
 <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org> <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
 <d6685094-b241-415e-9e56-d2fba75f3269@kernel.org>
In-Reply-To: <d6685094-b241-415e-9e56-d2fba75f3269@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Aug 2026 09:40:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPu5tuWA7MhC=48r=1uP3LK6hSqY7Egy=56V1Dqq1wRg@mail.gmail.com>
X-Gm-Features: AcwNN1WVXS8N4-UYjDXHL5iUmkkapXer1429A5JjKjwhm2wT5WS30SWZHssAmw4
Message-ID: <CAD=FV=WPu5tuWA7MhC=48r=1uP3LK6hSqY7Egy=56V1Dqq1wRg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 20, 2026 at 11:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> >>> I think I've presened my problem fairly concretely [1]. If you hate
> >>
> >> There is no description of the problem at [1], except "bootloader adds
> >> the same type of calibration data".
> >>
> >> So I repeat my questions: to every UFS node? To every node? To one UFS
> >> node (but how do you guarantee that?)?
> >
> > I'm sure it's not what you want to hear, but I guess my answer would
> > be "for these boards".
>
> No, the question is how many aliases you need. Devices might have more
> than one UFS storage, e.g. ExynosAuto.

How many UFS aliases do I need for this board? The answer is in the
patch that started this whole discussion: one UFS alias.


> And then someone might need to calibrate UFS and SPI NOR storage? And MMC=
?

Not for this board.

If you're asking about all future boards, of course they may have
other things to calibrate / tune. My point is that the contract here
is between the bootloader that will be run on these boards and the
device tree that will be run on these boards.

FWIW: the idea of a bootloader using an alias to find a node is not
something I invented. Coreboot (the upstream, open-source project)
uses "wifi" and "bluetooth" aliases to find nodes on Chromebooks. It
uses these aliases to place MAC addresses (which are stored by
manufacturing outside of DT) into the DT nodes (where bindings expect
them). Perhaps coreboot is doing it wrong, but this concept isn't new,
and I didn't invent it.


> > I'm not quite clear on the "overlay" suggestion here. You're saying
> > that we should require the base device tree to be compiled with "-@"?
> > ...and not because we necessarily have any overlays upstream, but
> > because the bootloader will generate an overlay dynamically? Compiling
> > with "-@" would mean we could give a "ufs:" label to the UFS node and
> > with "-@" that would be preserved. The bootloader could then use the
> > "ufs:" label to find the node. When compiling with "-@", the exposed
> > labels are essentially ABI. Did I get that right?
>
> I am saying that if you cannot answer my questions earlier (and you did
> not)

I'm still not quite sure which question I didn't answer, but I guess
at this point it doesn't matter.


> thus this should be treated as adding calibration to multiple
> random nodes, then essentially you are reimplementing overlays and this
> won't be accepted. Instead you should use overlays.
>
> "-@" will give you the labels in __symbols__ section, but it won't be
> treated as ABI because it is not feasible. No one would remember which
> boards have @ and which don't thus which labels are needed externally.
> Only a comment in DTS code would prevent it from being changed.
>
> Well, same for aliases honestly. There is no tool which would guard that
> ABI.

Given the above response, I'm a bit baffled how "use overlays" helps.
Each individual board will have different calibration data. It's
presumably stored in something like an EEPROM on the device. The
firmware is getting this data out of the EEPROM and putting it in the
device tree. This puts the calibration data somewhere the Linux driver
can easily find it. This means any "overlay" would need to be
dynamically constructed for each device by the firmware. In order for
this to work, there has to be _some_ guarante that the firmware can
use to find the UFS node and add the calibration data.

You are saying: "no, there isn't."

I suppose one answer here is that the UFS driver in Linux could get a
phandle to a "NVMEM" device and read it directly. ...though it might
not have permissions.

I suppose another answer here is that the UFS driver in Linux should
somehow figure out how to directly query the firmware for the info.
That seems unnecessarily convoluted, though.

...so I guess the answer is: time to hardcode the path in the
bootloader (shhh, don't tell the DT maintainers) and end this
fruitless conversation.

-Doug
