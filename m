Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640F5258EF6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121710; cv=none; b=F2aAq4b336gbVmax4j1nrcbQ70l8VrMwCN9PZ3mtYfk1wJ6aT3n0+rKNa+7g2qHch46Ou1B1757Wamxi2Kk1wWijup78R0p58zvLslzPSYntauIN78Tkdig5ojCPD4v4E3oGvlGuyHtigds/PnrEX/L+Iwzdp8kKZ1cOy9Pihww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121710; c=relaxed/simple;
	bh=zGOK22sVIH8+swCgNPprUC683jqsvjAm8vqDPgo2mEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUDqVdwzVaEq2qp5jrAbURGdYh8rJhBiLlpME3pKX74qhDGDAZGfudu/XRgr45ntqtVhFIs9h0pBK2D1ooYEewNILLEqEppIjORBeJXvP6X+bj2OjD7FIrQXq2dzFzGWnf+X5BKjRZmWkyc4BvRonZgqlsXb2TMVaQAQJ8/PeVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ih9Jwx+l; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ih9Jwx+l"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45015646170so799704b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121707; x=1763726507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gWt+h8z2Ss7R5dPrx1HuHd/mFqNB+Z89pG6552t6M0=;
        b=ih9Jwx+l671inHoOTHEnjtY5V5ASPiII1tOCCE9uJOvitCqiyESYz6yhJKj3D9KI5U
         XEYzj7mHFMYUQFFMfDhunI4BwPfkwX8qgS+2lEL0Y4foZm+6zogcV/rKUBnvuOvWfGoM
         5mumUdZQ7hCfOw2w82rbrr5deNvFyOyFN4nUZ9JrupHDSW7l8C7iA7UEMUNVmY9gn852
         rjM2DUO8WKikiPW9Gyo8CFgJZzcQQsomhYaWHY8GaLCt/0q3Lz60j9wJazWdMuiSpmF8
         QTYz0/v+vOvdjv3tK/rl0T2iPd+0H8nUhXVdib2ks5keSGpd9El92mmmLghXrx+3nmps
         ravw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121707; x=1763726507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gWt+h8z2Ss7R5dPrx1HuHd/mFqNB+Z89pG6552t6M0=;
        b=nPGoVQwXuMBmjAl4mkjvr2gqVTE1tPxXW6gyim38az1+Ns7L6yVonGPVgurKIEZBvm
         WC2qDJsVFSg2lYFqXwarOg3Gl+GnHgKnHC6d77uuypiWN8ycWLnYTuUCy8D4tYfLxa++
         /31r/zv2is3gGl1FIAlqg5GS7zQ/3kYnpXJ385ko9xzYF9bVesjtLoBG5WyTRBNOBMIy
         vup/FGVFEyud8gNHQaZ8jTNyui3ak/47k40ru1Lrzb4xZ+RCWC43sA0ZCsE6U8IkgIsF
         IUgkJVg39dCb8vJDwXtM+dMlLEz3uLpFjJsgB8I8bor1eIH6QspWCVptzCi6jEZAhkOS
         X67w==
X-Forwarded-Encrypted: i=1; AJvYcCXAFMrZH0SZKOTHFEWx9myqwaJn8PpEWTPrGfqYloI9BakNy9KWbbvhDS4MoLw5rrpJW83OqJUnM+F6EyJlkdqx8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Cax3Wgy4FUMmLWTZCei3ofsk+M7hWAx3a3in/vqZLfrnfAV9
	8fY68rWcj96BHeXJeSCRleInW747bfaZeW0CIA49NkHZpesAeD7/RiECXz4K+xV68SWA/UIzINf
	7L8NOLWRiqUBATwsnKlWCukX9oJTMB0F5TJ00qC9RGw==
X-Gm-Gg: ASbGnct3eidHFVSHxO/7Ih4+XyW9bSa/7uYOtHA27ZoXGiWCDHY78QXIeMteggrxN+i
	vPvhNcoXBzoHU+p5QMFOZLkkFSu5ScvARgm9rIlhC1MMnhKM6NDO8N3lGj9gxISPzuRKIy7td49
	t1hmQi2yG7FYbX9entkjH1+rpK/ITGWbd3el1tT9KHu9AYaZIDWMvD0OxVxAOy+ZG7UnYIoW7gm
	woOEt1ORmpQmwFnLt7QDpjzkDwEPJnmN9RDMtE99pTX0tYot8qfsbaxQ71u
X-Google-Smtp-Source: AGHT+IF3Ojmnkwzvj4mx3ICJHFTOSGE3H8DgYxvKJpIkWpFelTepwYr55k26BWA5PAiTHMni0lGmEZlB7MjGprr6OVk=
X-Received: by 2002:a05:6808:2185:b0:450:4e1:3afc with SMTP id
 5614622812f47-450975b1462mr1041084b6e.36.1763121707459; Fri, 14 Nov 2025
 04:01:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
 <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
 <20251112-naughty-romantic-hamster-e213eb@kuoka> <065678f2-3fbe-448e-83ae-e8b3e7ba96b3@kernel.org>
In-Reply-To: <065678f2-3fbe-448e-83ae-e8b3e7ba96b3@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 12:01:36 +0000
X-Gm-Features: AWmQ_bkL-XznKpYxkyk_6EauUHZUY13AZ8Gsg9pORNPYYA-SZiOeIuJstEYBnmI
Message-ID: <CADrjBPp_1APTM6uS9GqBRVfqHiwsiaQ7FD+5+uZakUFc2PDyzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review feedback!

On Wed, 12 Nov 2025 at 10:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/11/2025 11:22, Krzysztof Kozlowski wrote:
> >>      oneOf:
> >> +      - items:
> >
> > I expect new version (see other comment), so also please change items
> > into enum and drop const from below. items is redundant for one entry in
> > compatible (by convention) and having it as enum already makes it ready
> > for growing the enumeration for future devices.
> >
> >> +          - const: google,gs101-pmu
> >
>
>
> Ah, and there is also checkpatch warning about length of commit msg.

I just sent a new version addressing this and the other comments.

Thanks,

Peter
