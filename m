Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E8146548
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922368; cv=none; b=RMgbS/hlcCD8+0yB5KYhjQFV9OCnPDtKaIH//PyTdHpnSk3zFcjFPv4qGCtFKXz5TYaFMKg7aQL9dz70hsbC9lAR9s4uGE2vlOsAdjwMyM+fo8PnQRirVx2zzI2rQfdkvzy4WrJC/FFseYX99xZZQxn7z+5h9kPcdTMa0qeTjBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922368; c=relaxed/simple;
	bh=jNHCWw3WjlkSEZRJ7ufnyaZwg0nsdc0yG/XIpjumcQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Skfeh6WvnBw6jnACvYpUel9jW5NmjqrDJ5TK6ZYeGD3ny6iEU7EcerRaTrfeCsQ9hk5IiAurfw98GhB/UpMyhi6YeOdnDc443P+b4pbOY4OryyH1pfdmOLGshMuuH9OoWiAXaX7cTtDqMBXG/JbNNJ5q/mJjIJChwJHJdKZq54s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEZXiBk2; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEZXiBk2"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc223463ee4so2339664276.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922365; x=1706527165; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjGNrBbtJ6ZdRNqm2CfKscefqbyQaHrbwOzpcX0gGKI=;
        b=uEZXiBk2UBGP+ahT97hrxlHsQ7i1mcF2SzyueXdi3wu0xOORi6jY6LQ88dkormG9B6
         /Vdk761j2XB7rBKUtJrtnpTpBjKAgYjYzv9PPEdDOnbPYoSk86nACzbh+UdrT+6EK3vK
         aMyPZZa859/GBSrNL5cwIaiO3ZRn+Cfz3PqK7j9SIF4Sg8Kq6b02GJ5zE++YZd4oYgE6
         rpKehkpTbmE2QBkO1wKlxHsBjvGv06YXZk9p+WTsZwWUNdp8+tmhms2bjoLGWS8Zqo68
         Z+7Vaith6hxgb1yqzSsXw+g2o7dXI7xeNUMJ+NYnfNwifIH3acvDyUPBOXqjruqzXRzI
         ai6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922365; x=1706527165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjGNrBbtJ6ZdRNqm2CfKscefqbyQaHrbwOzpcX0gGKI=;
        b=GXLJd/fkYP1U1/Iv/Z8m4drmYrL9Mbdl8a7+SldK1E6oV4DlBGB+iujmgUvJkhC8kf
         /nItWyQ3NVUB9/8zqVdkmUEQwUU+yJDc4ncXlSmR+gGFJQYsyO9+Zl8phE3pgOh4YPR8
         XskwsSvOTccHmuLCP5oYdIbNsJ1dotrfxIDpIzUkmAKokK0yLnQ+DSgansfEKgeV1vSr
         p6pjZofIfj3RxgAjHoO9Hibagiy+YFimU91yNkx5eOCS6+/TBzSRBVLWWoTQF81i7StR
         vvJMDZG6ccf3mVbqgWzf252XEPmx3KBdtFXwERGO8z6zfJsjtya9BJ1iAhZMqdbzH+Qp
         R+8Q==
X-Gm-Message-State: AOJu0Ywy1y5Ez5c95Ngr24KZvJDkjQHi6+jK3FzWgSsP9TvXtJ22zozq
	DLx1YdnB8+0Wh2erY8U/dLaiyz18cSlyiz6c+5DrNZQ23YWc7QC+DlSEpe40PzX7IcrD/UNbXIP
	maxM56epXz+/lq34lxVzz+oZiw+jLZr94If0v0Q==
X-Google-Smtp-Source: AGHT+IETeFU7o/bacSqz6mq7P8PAhi+QJN5FuxtRzOe4hfEbxRCFRPWqRvzeRZJuP4XQwexHHRuWXgq1GBOPJoErIzU=
X-Received: by 2002:a25:360d:0:b0:dc2:6600:4eac with SMTP id
 d13-20020a25360d000000b00dc266004eacmr1369699yba.116.1705922365085; Mon, 22
 Jan 2024 03:19:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222165355.1462740-1-peter.griffin@linaro.org>
 <20231222165355.1462740-2-peter.griffin@linaro.org> <4cc6df4c-504c-499f-be83-3b40d1ee6240@linaro.org>
In-Reply-To: <4cc6df4c-504c-499f-be83-3b40d1ee6240@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Jan 2024 11:19:13 +0000
Message-ID: <CADrjBPo6YqxDAKUe629Z3e0MtmEgyTqEzVLLc1bZ8xJe_dw5SQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: timer: exynos4210-mct: Add
 google,gs101-mct compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	daniel.lezcano@linaro.org, tglx@linutronix.de, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 22 Jan 2024 at 11:00, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/12/2023 17:53, Peter Griffin wrote:
> > Add dedicated google,gs101-mct compatible to the dt-schema for
> > representing mct timer of the Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> I applied remaining two patches. Let me know if I should grab this.

If you have applied
  clk: samsung: gs101: register cmu_misc clocks early
  arm64: dts: exynos: gs101: define Multi Core Timer (MCT) node

then if you can also take this one that would be great.

kind regards,

Peter
