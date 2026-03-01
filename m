Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72605302779
	for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Mar 2026 02:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772333869; cv=none; b=lG7m4AohtemfxZkJvq+/YoDhbDyW3nbDoOEHgF8GFyxjx3JyBMY8qg3Hq2JuvBjBpAyKgP7gW7AIk1AXsGEOc6OpX2D6IzMvZt76r0MV5oaoPf9jDd5Yq367aMvQoSi4e9X3GCKzY9BCzXBsxVEgbEkA+3jZDZuWaAkzLz52Pm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772333869; c=relaxed/simple;
	bh=v7j7u4Cgs/YgDdAJ7Cmwg6YLlgzhvBFEmlTEsg17hQE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GgddxoZAmjzg0QRr8lPpDPmdaxgcram+cV+I6nKuWTckvHScbSNQqoByCew/B2qkGLoNUol6sZ4kHUdNWHrpetWO4EAm+odAUNa3jPNMlqOCWeBAgiI+tUrqvpZKljp460Doq5SKz7BQXU8I8JSWBf4M0pflDZWZUSXsjuGwpqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8sykDSF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8sykDSF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48371119eacso40208815e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Feb 2026 18:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772333867; x=1772938667; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7j7u4Cgs/YgDdAJ7Cmwg6YLlgzhvBFEmlTEsg17hQE=;
        b=B8sykDSFAyaC67iFyk4CYMeKS6Il9k1AUltUMttpfugW/RVix+yn1tROE+MVWY7597
         zPP6ejKH5rx+uu/rJhHP2wRfNcO31ZxO7+gG28k/E+M9wXr+JAO4ejq8uurzjF7yLOQj
         dAZadi3O9SihNq+f3RPFa4ynZ2UClR5y84C5bYhuvOzEa6q6kT9LJq5gfqnmI/TCu4rA
         N4ls9Sp5C4aY/9wAHeS6sK1c3znjZHgnBorPoqj4aMZ3dl5thqujzXWiGljCS+ksnjib
         yt1JowWzDvtuZLwQNP+lvWrT093WvZptGIgEB3pnQLIwQdyh90+DAOYkqvYy1pRsktoL
         7sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772333867; x=1772938667;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7j7u4Cgs/YgDdAJ7Cmwg6YLlgzhvBFEmlTEsg17hQE=;
        b=OPx9bQFZQs9hPNYnj3Zog4GNUSpHi2YCcZDGwkQsKJ9kIMSPLpnlpVn1lKW6OntlIR
         HO+LzPYoDWa0Zj/myH6CkxHEoGyUF55CqQ0qk/K37pqswMsA7GkI5/xTe3Z3jzwbYvYC
         ouBPTQD0BuCj55cWZbuCCtC/OBT8Vpd8iyZrtvBiCw72Z65bESWzTpI9mP8elJW10El5
         fzRIGfImhxzd38cdEEI93g9PihGAiEhoXkItN6eb4lLuFeySwsz3qkcL5zNxZM/YX2Bo
         ooYlt13grR6eI76tOtc5wylIkWilu6Xhg7DZ3hGnR1WsOUkNwrY+QPCsiful9H+P8WJ5
         gV/w==
X-Forwarded-Encrypted: i=1; AJvYcCXE6odmq6ZCI5j2R5Dhb5k7D8GticlBaAuYVjZV/AeErO8hNoZUax492+WArfopXG7VgeAZulDojbJiiOuwFN8vPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcFXOyOWW3+gNNggRRjUFfHH+/w+yzv0keZ3sELLi0pdVsejvu
	9TuIPXvJIoONVTpGUtvdQJoawIPllhYEJY0FaZa1o/0nR4HeB3B0or7b9ITtpQIARM8=
X-Gm-Gg: ATEYQzxvFDoZs89WgOne+JiBi/1bauUc4jTbHAN8Et0ltHOU5fDlkNAqeu6K1NMMr09
	hKkBxufCyNgEJhCuODJlTULybPS/E5XcwGpeX9REbsIQRO2ab4IeQv0m7rbiSaK0G4BMHDbM6qf
	Pcxp1R7fXNfgL6UPYmLGVwia/8o/kUsY/eT9WhDPugGNhFqISswptP4mNrTheNM5wSb4lAmGN73
	mb1IdFL56Oj0AmLoJZ2Mbbfx9tPrYO24Hqp1S8YHASArarwxgphThxpYyPwr+oKtm7hfko9fEsW
	+IB0b1+NMs5T0k75cdFIZU9dtpTZQj2g/rHUvJWoEz9a8o55nt9wSXedRq7u5FTBZ2t3PE4bB3q
	0sMMGR1Fa4muVhKZDgQtt8KBaG7b+FerV4TtT70BHUhQ6YSaaNF20ryj4KjAR++2uDuWE7WbZbD
	XXmKWlxJkIzWVOcMLzY32Ujawk5xqwfcFI6ci5TAqjNJ9hdx3CvTFPIpCWy/xDQKyxseXn0As7X
	coNFlnI9WYHs4am9g==
X-Received: by 2002:a05:600c:8106:b0:483:afbb:a064 with SMTP id 5b1f17b1804b1-483c9bb7b7emr131516965e9.1.1772333866793;
        Sat, 28 Feb 2026 18:57:46 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:6ece:b3d1:ab81:6eaf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c764a35sm19633263f8f.30.2026.02.28.18.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 18:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 02:57:44 +0000
Message-Id: <DGR3X53FPO88.3C2UO0HGRVQGF@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>

On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.
>
> The GS101 TMU implementation utilizes a hybrid architecture where
> management is shared between the kernel and the Alive Clock and
> Power Manager (ACPM) firmware.

[..]

> Sensor Mapping (One-to-Many)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> The SoC contains multiple physical temperature sensors, but the ACPM
> firmware abstracts these into logical groups (Clusters) for reporting:
>
> - ACPM Sensor 0 (Big Cluster): Aggregates physical sensors 0, 6, 7, 8, 9.
> - ACPM Sensor 1 (Mid Cluster): Aggregates physical sensors 4, 5.
> - ACPM Sensor 2 (Little Cluster): Aggregates physical sensors 1, 2.

What about other non-CPU devices? Are there no sensors or implementation
currently doesn't support them?

Is this implementation and ACPM TMU support exclusive only to GS101 SoC?
IIRC, mapping could be different for other SoCs and, for instance, last
sensors could be non-CPU devices.

Best regards,
Alexey

[..]
