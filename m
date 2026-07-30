Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C993B5301
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395966; cv=none; b=Sp05dR3I3T/42Ya9ikPE+Uzorfovi+EfWsBhLVBHHsyMZ9ewyYwDPb6UPXVoUuYNduwudSBhh9lMzYLhfCb/TJe+pOJIIxjcPU0i2gvdmkRktj+Db0ohu8C0roK/IQ1vGZ+OHcXKUFMKDrxldg2YHIOzVhvzag8T2yOf1dl2pjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395966; c=relaxed/simple;
	bh=o92yQvxUqaTH9jym+90EcVtlkrdRh9f0R3gdaJcI2yY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HCvr7IhILMAfiTMM8qHvIHuuVsEINhnTWe80A2/npJHvkY4PtNjH6jpjcqQhBVeOCjurSgD0cEM2BiF5N26dbRcktgAATaJ1jTgFLl4gLiq+bMkItOgc3DhxRfp8ALQSw8e7dxIL4mAm3PfEkT+h/dqN8CosP5/hdXj7uQBz6Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDZvIC0b; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDZvIC0b"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954df200ddso10460315e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785395963; x=1786000763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y5QAVeNEbw4rwpIis7dsdZArac2vQn3qNAs9Ae58oc=;
        b=TDZvIC0bfDa4fCzOf7s2pZOBbLaDjH1d8WTo2EM2K6gTfySeO1XAo3bl8wG+S3aLCK
         +D6oJyzgcXIAG5XuRCIF9t151BQ5OEnnA8/unICrufrKxzRf4/675C/yRahW2IilUwTW
         SJ+RvV1TjEuUsiATomvXsM381YjyAK927SHPvI6zwrcS+ObWeypRcrv3eDT7glKB7xsk
         nzJTjktJ1LQWRtvfOgreT2d8sR8GQ6lo7WcQTvh8hqc8edtX1JQEyYaCGZ61QKRx1/99
         ajHZMP14tW1INTJgOeYjF2ua8wroOZF/iML5o6Pf0LfOXmhfLLcE3Jcwy4HfEILv+yXp
         raKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785395963; x=1786000763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y5QAVeNEbw4rwpIis7dsdZArac2vQn3qNAs9Ae58oc=;
        b=BruMs/tjcjG+Q7giLt7EUbTPFz7BSCseRFPCX47cp5g26MdHkD1xBONSeoeE3ymAkO
         0T1YUHscFDYuhLOoDf0loN8x3qi9tWDZoazKmmUJynu1mbAlVQn12G+m84/q4dV7Jn6z
         IxdRr5XYxcXVnlvknKuxW5oKxyt2qLQnDgp69iXkiaSns6UB9yAnSEsb5JoDeny5dHux
         hzZu+OcDoNhft/rTdcwsLb7SsWhtms1eWXIeXsVeP8y3PtRXirGacTBErwyfKgoRCUWp
         ds7Mj3obTI+0p4h6Jz5vIikW8am4UpVS5KtPMlXn4Q1+L0lXNh3qs/xrQVsAhdNaCV8E
         Jn6A==
X-Forwarded-Encrypted: i=1; AHgh+RoOTEtQhDtzkdB3HyMimpqXgNTcYtaQbdRloI5nF6wHwsmQI8Fb91GLkM0eJOI2vjNd+TwshnynmC9wieJyfZN1fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7fJ5TTLFWboiOys+USu1pn7jKbQ2gJ+1SuPqrRDHFjrzmhYWf
	OptJ6q2OTCfDnXW0X6OTV0376zCKJ1tFkegy1RbeVsU6yz5qwj07laV6
X-Gm-Gg: AR+sD13U4WX/Rh8lhITTGGP69aeQqomt48g3p0wdjcNhjQlTTVI8I4Q7AESymXB4EfI
	Zym4/3rjLX4AKSgO6REv9vxqDhIR0acXeEbxhrIQJ6IM67VTyRyXRZU77UFwmnNtYnAE2g6lxhZ
	D6qZg/PALAd7CnGyC+41JJBrrqxptfXQqERIUEYaWga5hVjyC3ljOku2LIPYn+Zx3+DhvH3Wh+0
	0KLB99d0f9+aTN7VwA82PFxuQAraGmrNLcPW/sh9qPO6UyfoYR0X3v38H2V4VeY82YimfIP9GeP
	atpofcF4+TJzQUE6s4Sg7o4aaoXIC66uWT9Tct5koACABdGrRYFUVnpaeT9o7Ayuo4pywB4Dq9h
	9/DgFVz4RQ6RFvpAvMVJBF/ue4B8pWR/9fBEX5vTiGIOZLYAwvn+LmlbanKSK7TlDHqy1U9Acn1
	RfiwSFoDyCrfvkadWcrjbnsZ2OfNmUyNy6FSYjATdvUHNgZ+zTuy1Jzz3pecMj4aznqMoy5ZFXY
	z7g9TUpUtBeUixqH733R6bPzrLV2OdX2Aoi7WulQI4BhL2WoX3ktmTRrIpflwV5UX5s64Vj6uYh
	zJwqPIA//CFOpTJO8YQ6uMMG7wRgJ2nLw+vG5pP03DntE1yq4lYLR8PjJ1wsVILm0Jh4l9yjh3i
	/VQIPAoHsDyRVu9NyrXh8OyjnAZ/7Ef1DozdLapqNkM77016JbBfRh6MHs4Veg/eo+mgC319r
X-Received: by 2002:a05:600c:3306:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-49800e753admr10529425e9.14.1785395962626;
        Thu, 30 Jul 2026 00:19:22 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d6e68sm3625182f8f.7.2026.07.30.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:19:22 -0700 (PDT)
Date: Thu, 30 Jul 2026 09:19:21 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Message-ID: <20260730091921.00002d45@gmail.com>
In-Reply-To: <DKB8WW9AK4KQ.2A9KVJWD5ORFT@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
	<20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
	<20260723234439.06411731@systembl0wer>
	<DKB8WW9AK4KQ.2A9KVJWD5ORFT@disroot.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jul 2026 23:23:45 +0530
"Kaustabh Chakraborty" <kauschluss@disroot.org> wrote:

...

> > Please add iio/* includes after the generic linux/* headers. Ensure
> > that there is a blank line between the two groups.
> >
> > Additionally, you're also missing <asm/byteorder.h>, array_size.h, err.h,
> > types.h and delay.h.  
> 
> By the way, is there any tooling to satisfactorily point out the
> shortfalls with includes? Or is it just intuition and experience?

"Fully satisfactorily" no, but there is a tool called iwyu_tool (IWYU
meaning include-what-you-use). It requires Clang/LLVM on your machine
but it can serve as a pretty good starting point when cleaning up
includes. There is an unofficial mapping file for IIO that makes the
output of the tool less noisy, however it will probably still need
tweaking. Here's the link to that thread:

https://lore.kernel.org/linux-iio/20260512073505.1310-1-joshua.crofts1@gmail.com/

Setting it up may be a bit tedious, but I found Gemini to be pretty
good at this.

> 
> >> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> >> +					gp2ap070s_irq_handler, IRQF_ONESHOT,
> >> +					"gp2ap070s-irq", indio_dev);
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "Failed to request IRQ");  
> >
> > Just return ret instead, dev_err_probe() is called automatically on failure.  
> 
> Are you sure about that? I happen to call dev_err_probe() on all other
> places and other drivers (as of late) as well (other than -ENOMEM).

See the comment at the devm_request_threaded_irq definition here:

https://elixir.bootlin.com/linux/v7.2-rc4/source/kernel/irq/devres.c#L94

-- 
Kind regards,
Joshua Crofts
