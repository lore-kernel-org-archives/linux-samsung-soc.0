Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFD9261B8A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 23:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269667; cv=none; b=JmeYW8tizmgHwPwcuaGWvvrhFwQttSJMMMNDdkTQClmrh1RRiWnNxg1IQMXfNqSFVrNDNivBAvQT49PkGsJR+d+piSU976i1SqaVhMqyN9AtpIWMD/Fx5RQfc0Wrmjzq7gwJ9R17dwTn3YJi53CHZ6fXHTuAxJmWoq3CBidxMZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269667; c=relaxed/simple;
	bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acXMvhdtfHj11JJjiv3tbu+ioo2eVcmbIfYUkA8g9qGgF/IKz0LR/PqndcqsdTq7HeSZ17loWQZTRJ9FNizzHUYq3fpbQqNcjBHHbgQpJLi4bleY3FqFbZgTqKxaDTgqstCCRX4YCUhp/UQlqC/7bKLdhbjcuS8sFADzZC15OU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gBk+PXUC; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gBk+PXUC"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c7a743cf8so517252d50.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787269665; x=1787874465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=;
        b=gBk+PXUCVHG5rFcb60zMzW0flFwQ+yGKrQXY6SogT1WubXkuuKUOO1FGUNpVIDxx/F
         upbNM8+Nvyr8+gLxiH3WAPXaRy7x0bWa+MKFGfjlyNMQZA5s145tPu08Re5ijB29loQL
         FUSVZJlGGKUdsdx7EVWpVYOoLHRQqAku4EKy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269665; x=1787874465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=;
        b=iY2QKE1xpDo+QEYNkpLcRl58pzKmYtetn4T309sdAwDo9qSDYugaAYiJLHsZch4qSl
         cddT2Zdi60IN8hkeBw/SkRDVcNvjGQqfAzeWYWDzwohCexVLI1t6Z10UbAWT1R8jAGOp
         xvViphlJ+8+BruWkLZ6gXM6vWgfFYolpYYVbQEW4ytJRYH7yUXe9w2/dt+2RxyTO4Yh5
         xiZih1svxTa0ebvypmvoCM4qafjnE5BQ/FhfBnYBy6cZ3t/iGspo6fWNdS0eqORxB1K4
         +zK+dgYKe8JsFGVzbMbfBZMcsm61NoRubj5T2/hR/xqLIEGQntVGBQdvSyIsse7jTrLb
         1mOg==
X-Forwarded-Encrypted: i=1; AHgh+RrSRfIfNG3nDys+o9vg+C/UWfxgpRG8XBc9DCCeUZLXWA1+MgwoU52jVBfC0m7XtnpXeYa60ks5xlBp6HoPNksG9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++l0hvXexp7dVEmrym1FOhSMcVX1zM60GhASVKiOEHEk7/L6UD6U
	o9UxoElB6jjpSikLsgCXFk+BH5TWOvPRCwMdL1Qb8hxWmvced0mE2AO72/Wb5HdFgEOgxaUsrF7
	NO8Y=
X-Gm-Gg: AR+sD137TgWxrUjn8TFyjTcL2yoSqTGxGYqEa4y3dWXPtJpUu3QG+4EOmV6I9lTrUMH
	cGPAvRZD9Yn6lxE8RRV8dhtYpW9165sJoayijF++JwHRDalewIqRgrHpPjKyUKAA4yIm/CrtQYa
	5wmpNkGbQiSAIsWGbt2c1/QiliSZ8pvq7RpO/H+qg6NYuBJhQLNwi2ao+HvTdIUTswhEtshjLTm
	pTInr1ACbTRIcIE0VBv6AbdRo0I5oYePFmkdqPnDma5TxM8d/dUGfpCcwvpmnKmdgONZXOKppik
	YvBMS2l8MMSpWJFecMOz71d5nU1LUPSvkSjzAOWdhN65jfFS/ZR+g6bx7ux3gABVMONs7PqU84G
	RL7gYFznEGdjAWlwOaSzUcLYLX6ZcDyih9lkfCZ4ISvvn9uluUVa8GBRQ87uCBspXyGos57HzJb
	iCEn2t1JcdkMsTrWsTE3d32GxH37zZX3FuZBbD7Eeo5BnTAsXQdvLbzjdqP97g6hzcMAlK2sp3Z
	jTDc/Os89iSECiS7opfM1/iOZp17mlmbY/Xl2Yigw==
X-Received: by 2002:a05:690e:4089:b0:662:ba96:9fa3 with SMTP id 956f58d0204a3-66cd6888addmr3496476d50.3.1787269665279;
        Thu, 20 Aug 2026 16:47:45 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccb1a03c5sm3431043d50.20.2026.08.20.16.47.44
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 16:47:44 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-841f1dfc30fso24630587b3.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 16:47:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp+w9z7DGMyqW2K/Iypz6j5WwgQ74CYYJXxZbPc2o2Z91vWQ5EYrwW81DnP2Y1yRJC/tgyLcQ97MC4p5NGqvdnebQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3032:b0:747:560c:e7e0 with SMTP id
 ada2fe7eead31-778f05babd5mr1953525137.1.1787269272014; Thu, 20 Aug 2026
 16:41:12 -0700 (PDT)
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
 <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org>
In-Reply-To: <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Aug 2026 16:40:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
X-Gm-Features: AcwNN1XRfcu1Y9Mu4rBPOaQuheZikf-15PdNleMMKujFPqm2AwjeBRozlHD45_0
Message-ID: <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
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

On Wed, Aug 19, 2026 at 11:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > I'm happy to document. Can you please point to how / where I would
>
> Description of:
> Documentation/devicetree/bindings/ufs/ufs-common.yaml

Got it.

If you tell me that the patch won't be instantly NAKed I'd be happy to
post an addition to this file saying:

If this UFS controller has a well-known ID <N>, a "ufsN" alias may be
created in the "aliases" node. If this UFS controller is a singleton
(no other UFS controllers in the system), a "ufs0" alias may be
created in the "aliases" node.


> And obviously, as with every binding/ABI, you also need open-source,
> upstream user of this.

As I understand it, this isn't truly policy. I know DT folks often
want to look at an open-source driver to ensure the hardware is
described correctly. I also know that a badly written but
"open-source" driver doesn't justify landing your bindings. ...but in
this case, it doesn't feel like there is any complexity understanding
what's going on.


> > document this? As far as I can tell, no aliases are documented today,
>
> git grep disagrees with you, e.g. second paragraph of serial.yaml.

Ah, I see! I was looking for something more formal. Something like a
list of allowed aliases or something that would automatically validate
which aliases are permitted. You're just saying to document this in
prose.

Thank you for clarifying. I didn't understand this based on your
previous emails.


> > I think I've presened my problem fairly concretely [1]. If you hate
>
> There is no description of the problem at [1], except "bootloader adds
> the same type of calibration data".
>
> So I repeat my questions: to every UFS node? To every node? To one UFS
> node (but how do you guarantee that?)?

I'm sure it's not what you want to hear, but I guess my answer would
be "for these boards".

In my opinion, this would be fine as an ABI contract between the
device trees intended to run on Pixel 10 phones and the Pixel 10
bootloader. While I'm still of the opinion that people should be
allowed to include UFS aliases in general and it would be handy if
that affected the "dev/ufsN" node created in Linux, I know that's not
a popular opinion among DT maintainers. If upstream would allow a less
"generic" sounding alias "google,ufs =3D <&xyz>" I could do that, but I
doubt that would make you any happier.


> I gave you two solutions, depending on actual upstream need of this. If
> you have the second case - so not the boot device - then you basically
> want to re-implement overlays which you cannot. Use overlays, which
> gives you nice stable and build-time verifiable label/phandle.

I'm not quite clear on the "overlay" suggestion here. You're saying
that we should require the base device tree to be compiled with "-@"?
...and not because we necessarily have any overlays upstream, but
because the bootloader will generate an overlay dynamically? Compiling
with "-@" would mean we could give a "ufs:" label to the UFS node and
with "-@" that would be preserved. The bootloader could then use the
"ufs:" label to find the node. When compiling with "-@", the exposed
labels are essentially ABI. Did I get that right?

That's a pretty neat idea. If you confirm that's what you mean, I can
see about implementing it. It would also be nice if you could confirm
that this was an OK thing to do even though the bootloader is
closed-source.

We'd obviously want a comment in the device tree itself indicating
that the "ufs:" label is consumed by the bootloader so it doesn't get
removed.


-Doug
