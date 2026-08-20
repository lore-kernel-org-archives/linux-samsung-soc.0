Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA38313546
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 23:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269309; cv=none; b=RbVZNNqd4PXIn8J4JwvrYtvfJybBi9+3MSKqCuxacynILEr12BXGh1rVGSJkmF9p1S9+vI+GHdE9fCpw7Q1ENl91vQtuX26CnMJfoZNmRUJGqyv9FGseCAnRFHv2C7MRQKh2b17B9aqrA94SlbL5dtYx7jHYToNq9gWrX05zlfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269309; c=relaxed/simple;
	bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqHEI8usbVwmYvtYcaeY5MPt945dmeF6gm6sy6YU2MX5Zrow8qUA0wZNnK4ogOtAI5dUZxZLo67rhYD/llvglLY0/yk1VxAmP08+si7hSa8uKXaT+3ICCcoBepQa259U/OmG6AHm3b7uOE0PYOfGc8YSFms7UZASCEC1nmNDwp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XRfJlfpD; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XRfJlfpD"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966eabad303so124925241.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 16:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787269307; x=1787874107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
        b=XRfJlfpDbEZSeVrJtqh73EITCyCXpHDHjKWPfL44jJ+MFDmL37jQt8fF7WyI44/MCM
         Eo7iUX3Xc8e0zGtzDsThrZ51YqRI/sXossv2UE4SgJvVTnJsnpWWVOBgYynaMLh1MR/5
         ZtyKuXkLsq0N4T1fnCjZJdKu7YckTvs9gFmVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269307; x=1787874107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
        b=IJvWgH6MuP8MYd20J8Cmp3SahjFkFKGzQKYdsQ8wuB7jOtX0eZTXoMjOzP+K0rBivV
         b3gu1siZd8J813RR+4SN+z/KNFpgcdBfnqgkQli9NJrS7sZKsnx6EGqj+Qx4ZbNGK2MF
         mURkFK2hOW9ZUouFruFfIAdF/62fqRAmN6WkjfNVATdqhWYfZZWbk1gmp7Sm9xMyqb1A
         SRDb4zcz6VfH2gMO+yt41mzuj99hUWfkl2keu58XePVdnrNA2H73y+RWr73SCp5ofxCj
         n6y5qAxav6aYANqDCSg4XjsX7rEIf4bmSEOMezX+y//lik1pT2VlmQNnbt8C44l3OUBa
         /3ng==
X-Forwarded-Encrypted: i=1; AHgh+Rrug5K381WWHMnPg72tq70L+Mt88Jnqa4vWSA8MwC9NLvb/0eA7cHzfWpHXysdS8f0xg1ZQyfyCeT12wZvgtG1O4g==@vger.kernel.org
X-Gm-Message-State: AFuF++l5KiQ+TmX4SM0Otgu4lYHJ9gwP0KuPKRLvG4NA+9ER0zNRYvLY
	/6IJ4oi7FkyFiPMA5FrU53WSFBNc+xwkHj4Ju6T0PAJpm9y8T7v4QqRQCYfFPS2MalOBXhwwfcH
	sYVw=
X-Gm-Gg: AR+sD12ZyZEf2Z/NjtZCKmak0xgzxPD9sOJ1+L4A+/pPI6EOzrpO3Hcwip8wTUuIeHT
	XNO9ydQViG4e4RA4DllJgy0UoJnaICRfqPLvxroISlWTQeAPSMqDQcXHnQ36aL7CbMNDb9jAw3N
	Qef4BdjgKYlohDYFkOIO8gTjj/6u6++SEuBVG55f0P6yCBMDSdOkL0WBldobjw3+aiJA7ldwKZr
	Pix0fp66lZmv65q6ogifOVvK7HHFcJoFw4hImpX3tx+UaqfxvJwWzaKJ3NWUZhMKBUqXahBYa7x
	mdgKoiee5Zn4dnLPQonq9w5mYOvZSKjigcs57qpIMeOBTVvZvsoyf3Aa+UQYsDhOI9zQCE259v5
	fEKJcRS5u0b1X2uz4zMI+8DQ81mv4Qcfe+8OTelatJAlmdLj8wbvo5cK9J57w6q4l+p3T2aySTx
	xrX9pEaXS48G4gOfgiq3JYukJKzYgThSQLzCmpfv7pZ3GQ9Ls+2Zv0mZmXdqMGqPMmvBuyq0r4i
	ThFvA76+97nc9oYIRTopwkNbhU=
X-Received: by 2002:a05:6102:6a83:b0:778:459:f0cc with SMTP id ada2fe7eead31-77a62948509mr941186137.4.1787269306684;
        Thu, 20 Aug 2026 16:41:46 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5fbdb21d6sm2239697e0c.0.2026.08.20.16.41.44
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 16:41:45 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso186735137.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 16:41:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrtRa1X1i00oAb4wtuxSJhywat3l0zzFU53V/Q4p8z+D7dJUxWaWhXzr5hRNC1BjvurIy7RzN/WNJHFS8iuBDzFTw==@vger.kernel.org
X-Received: by 2002:a05:6102:5809:b0:76f:eaa2:6fa7 with SMTP id
 ada2fe7eead31-77a623259d3mr898151137.2.1787269303777; Thu, 20 Aug 2026
 16:41:43 -0700 (PDT)
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
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
 <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
 <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
 <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com> <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
In-Reply-To: <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Aug 2026 16:41:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjWd8fRuByAUn-mk-fMJqJN9wrzxAsYH7yYY3XxoDFqA@mail.gmail.com>
X-Gm-Features: AcwNN1W02_U2EPpwN5r9pV16wwm63sX1fk_h0bppJD-El35NE0PVzCZcm5fPTEs
Message-ID: <CAD=FV=WjWd8fRuByAUn-mk-fMJqJN9wrzxAsYH7yYY3XxoDFqA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 20, 2026 at 12:04=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is where the imperialistic ambition of device tree
> kicks in: the piece of software - be that a manufacturing
> run-it-once piece of code - that produced said calibration
> should have *also* used device tree to find the thing it
> was to calibrate. Supposedly looping over all UFS devices
> in the device tree and calibrating them one at a time,
> something like this.

Sure. I guess this is one way to look at the root of the problem. The
firmware doesn't itself consume the device tree. It has its own
independent ways to know what hardware is present. Trying to get
Pixel's firmware to use device tree is pretty far out of scope, but I
do see how this fundamental disconnect can be seen as the root fo the
problem.


> "I have a random piece of calibration data and only I know
> which UFS it is for, so I am going to encode that knowledge
> into the device tree as an alias."

To be fair, it's not encoding the calibration as an alias. It's using
an alias to _find_ the node where it can put the calibration data. ;-)


> I don't know if this solves your problem other than saying
> "go with any hack because this takes place in an imperfect
> world", but at least it points out how this kind of problems
> collide with some of the core philosophy of device tree.

LOL. Yeah, I think at this point I'm ready to give up and just
hardcode the path that we hope we'll end up with upstream. ...and if
we're not allowed to have an "empty UFS node" for now, I guess I'll
just have to have the first detect that it's running on an upstream
device tree and have it not fail if it can't find the UFS node. Ugly,
but it'll get us booting and I guess will be uncontroversial.

-Doug
