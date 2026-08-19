Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3DE37E2E4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159104; cv=none; b=qvpH/a9R4YAKW4I/kjyMANocp7VRnB4wnTRb1Fx8JZ5Mez85wLhb2M08rPp7ouC/1s80D2oITvUx091lDaId9jJbmTtl+XGL0hmKAB0WvtLyrfxWHcK/8zY6iF8QxMz6M4IQBHZ+8ZrMRAa2bk2kbWwOsJmO6Zrg1MdKxCrwDoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159104; c=relaxed/simple;
	bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egZ2klusdGlvqTzoaLG6cQPiYiVmQgeSVGeHb3k3yVN/vtlw/zvDbDuxp8EupWcI6klD2U/0YfOSFT7a8ojf1Mw/wH7KvUUyzACN8dRklryafAicD8p3Rl1e5ai99otN4PHYsBkk7vCuNl9EzeH9P+rw9Ej5AuFIQ5QyRrwt8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G5pS0Xxd; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G5pS0Xxd"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so130407e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159101; x=1787763901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
        b=G5pS0XxdOfk8nmlJHHHAJvySBgKXZgcznYA22iDSJR1Uai0w0JKqqLtvFQmZsztn3o
         DPUS+NUjydEJhVojL8mbtlraTcITJfsym0FxC8DdQjAV+QlCHyIRKKdV6m7INzhjDLqr
         DPIaZqOuTAqUjSC4Blq4VmlJ+zDxirtdGLEEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159101; x=1787763901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
        b=ItNiEHeLQpobV+IkkmSdfWmkVMEPL0o+VWakeQjmknaiVyOtR36HM5e2uJrlreY37Q
         O+bbvjea3//RvPft1W8e4y1WjbxZTsxhVbBZLIuyFsXShHveHEorQti5+6oVW1MHJYur
         yZ0YNDg1lbXj6dgFHp0KYcMvDmhx4fjKUFHR4ingQ3lz1WouRTj4TNCYl1v1vxO/NX8m
         pqgEMtZwryOecHdAW+chOFkwaDvXP5h/7y4tJ9jLfKCizM7KV4gV47l2G1t+VdKLHEMZ
         PmDus8uiIW+m9UGKUOjuE/OQ5VRk32/7a2gu0RFdWAGCOOzxfQ2ttyfu3R66RPQwCcf0
         WuFw==
X-Forwarded-Encrypted: i=1; AHgh+RoM3TdyrRZ3vJueqYrLBe1wBD0BeduhosapKLhe6Cq0YxjTdx83XDGzwkcffcMI+CnDQLLxm1+/bpDHkWIMTD3nsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51L5oDPDELStLdVoDEuj+FnBPHKwZP649fIcWff9FZzP3aIcy
	gUCi9Z7//6KPAPJ5N5/wvwCZQqaxDL6VrVTFVSN7TyhhMKtBz2/P1ngdJExN1dn64oHBmEvV1gv
	+UAE=
X-Gm-Gg: AR+sD11qUH60c4+QPYaVx730Ruk7Ob/j7nYWZN7YzQYeRLcqSlAl393eEib5Xci+D0O
	F7t922LW70HB/XABd2Csrk1F9h96s/MfF30m7uy4i8xtf6w9wXlVdp30N6KwihtnPEv2CFnfks0
	o2Sor2N6NU4eIbmftod2C5os8y0vA6SlhhuJ+a08289gZrHebJhev7n7aXkHhfSpq/9h+FnOnBN
	ewZlSDLHu6fA8W8UC7RR99J4nU3LczBttrO2kBqp59NSppFGmtWmVrHKxoBEt3dc7u6S1u0YjcZ
	XH5AsX7d6Cd2xVwmoSsMaNy9NTByeiyLxk1NoHH1irmEamcjJQgYxwu048vdN1oCS4Xyk2b7A9R
	LsZTovbvwVvafx87gZnuECi9HFeLbQwtUQaLfo499T3AdP/pDcwz+wWK7fWs7nvP5QF7eJVEPdR
	SrtT5q+lLDF4B2ZKTy8tGfww5j9GeTj+aRtUjTWR8uyMJ9d8aSo5bmCx+9jMuJ/xNfubeAlvjzr
	mcVcz7X7Bom8FHmRX+dRVoYBZY=
X-Received: by 2002:a05:6123:58b:20b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5c5ef137effmr160901e0c.1.1787159101615;
        Wed, 19 Aug 2026 10:05:01 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e2857954sm2863067e0c.18.2026.08.19.10.05.01
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:05:01 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso85390241.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:05:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro8pFcaKOz2GIdaoOizi2zcVMx4Ivl5ogO712JHhtMN9okYPKQSC2Vc14q0PItSxn5TMKQfy6SxEfT98v1LRRqwog==@vger.kernel.org
X-Received: by 2002:a05:6102:4449:20b0:76b:2548:560a with SMTP id
 ada2fe7eead31-778f37d8a97mr140907137.16.1787159100271; Wed, 19 Aug 2026
 10:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <72ec1b1f-112d-4f65-897e-e99652c5a7bf@kernel.org>
In-Reply-To: <72ec1b1f-112d-4f65-897e-e99652c5a7bf@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:04:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ViYUB6NXKVNxnPGwvkHzKnNQQSJfLRhVx7T-S8t0kqKg@mail.gmail.com>
X-Gm-Features: AcwNN1UtXmY_Pr6A3vg9yN6JPfaZdRsVgtlhCWAfgMFRKlEKan_CTSIL5IjyAS4
Message-ID: <CAD=FV=ViYUB6NXKVNxnPGwvkHzKnNQQSJfLRhVx7T-S8t0kqKg@mail.gmail.com>
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

On Wed, Aug 19, 2026 at 2:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 00:13, Doug Anderson wrote:
> > I did some digging. As far as I can tell:
> >
> > * Nothing in the DeviceTree specification 0.4 [1] mentions that
> > aliases are deprecated.
> >
> > * Nothing in the dt-schema repository [2] causes validation to fail
> > when you use new aliases and there is no "allowlist" of old aliases
> > that are allowed for historical reasons.
> >
> > * There is a single reference in the kernel "Documentation/devicetree"
> > about not using aliases to assign an "instance ID" [3].
>
>
> No. The rule is saying: Do not add instance index properties OR custom
> OF aliases.
>
> Logical "OR" means here that for you this sentence is equal to:
> "Do not add custom OF aliases."

That feels like a stretch. While that interpretation is correct if you
read just that sentence in isolation, in the context of the patch as a
whole it feels clear that the point was that you didn't want aliases
specifically because they were used to assign instance IDs. The
patch's subject is "Document discouraged instance IDs", not "document
that aliases are bad" or even "document a bunch of bad things". The
sentence is also in a paragraph that's all about instance IDs.

While I understand you authored the patch, it still feels hard to read
"all aliases are bad" from it.


-Doug
