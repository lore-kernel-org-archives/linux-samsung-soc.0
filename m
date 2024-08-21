Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14F1AF4E0;
	Wed, 21 Aug 2024 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724259455; cv=none; b=E6Wv6VYUUKzHPEhJdEYmvWzQljlQnOsTKFEOYOubphzcklEf2z+0cyBh4zDeHXtJWf3RbE5vxrj6i2YFN6mEF3aVLrsEATmBzm0iE2XKUkyBETTNQsNZ0gf24Wi4omkyAxX0hVsJynEjy1wJ311miDHVRlruUmz7kVmpZCNk2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724259455; c=relaxed/simple;
	bh=1FrgQQaRlzsG5xoexbs2EiOqTtb1mHgQz5BJFGDDCSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZpJIr3bIyUrELDeGy6fKa4ZFw8fobiNVDbOt2NkUgcdilhE59jUvhh/VrDGk2CSue7IVyANNws9cFKz6eJyIYwHH3ZztxMbf09kNabeqI8ZXMc9LxAZXifv52dRZmIQn+/ciEpEUY4THzK+LKd6UB+vbdT8CeSGhK1UJ2aiAJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtLMjcIJ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtLMjcIJ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-70b3b62025dso4712449a34.0;
        Wed, 21 Aug 2024 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724259452; x=1724864252; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FrgQQaRlzsG5xoexbs2EiOqTtb1mHgQz5BJFGDDCSY=;
        b=QtLMjcIJuNrqRIzqMyKlTiDb9tEJtZhIKWAGdjWWL66y0Xt+RpnqWGzbV5YLXVFPvu
         ra3AyFFEfORJJpDW1zANe38+3sMa8lGxsPPuej3879C5ECfN87mzElY92PnMz0Nwikqs
         0x9xc5xV1n3PTCJHf7JDNomiuMUhL8QBUpF5ZhS+OtNdGLDQr+xiajhb6G8Ex+jFdK/H
         b3QpufeEvsvr4CQQEdRUtc+974tEWHRzZacQqtsatkPw6L/TNdmxBotI8j8zCblrCg8v
         3wogmfXtunpQa5T6wWLTaUFupyMbXqHQbHNdMpgXRiBfVJUPdKnBg6n8ZU+Gu4ClftJf
         Gvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724259452; x=1724864252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FrgQQaRlzsG5xoexbs2EiOqTtb1mHgQz5BJFGDDCSY=;
        b=CH8pIqfcYSRqaQqmo+uNxSHAgY03cwiZz3uKUiEvsRK385fwIhmDgOaGdtxaqVeDID
         sDP5iiNnMeWnJjDgwagPfUxLmHxmRuBV3GxyBpOFunVpn6+2zp4qY7J4i3ktNXsEQtmN
         H7s9nfu8Mu2E2+0djspJdXyljtrN36HpRC+7LL0rrBagmlXS0TatwUMgp8uv+0SEGGWX
         3ynL+sTCAxlaP4+/zNy5ommTIFjT2Y2AZdVoW/U3UcEZ+2ubFbt/CAz2efRdmVCKdOiZ
         6RnVMdff4a3JvCZZU0IZqMJaKvDjbOXce9eWOqm3218nmf+IGQhuxmvCyvQfQ2v3sYml
         Y4gw==
X-Forwarded-Encrypted: i=1; AJvYcCWWB56dmR8llzJOJyrbJ6qmvGAAminNDQ/YqDvaHPHK/CHk/vxAdvQTifb8AliAMhFAkoD9gH2HaHunENg=@vger.kernel.org, AJvYcCWf358y9ySfCTkKqp+v185qHvRis8RLfRusqd8cC7inUxNkZbG1NQOmjXzzz5WCMX4FP1HEISmc0dZr@vger.kernel.org, AJvYcCWl0FWpoL2PSC9I+TvHVCTPja4t0Er8q2WVFIJSVnoD3RfhdSDXEie+e6LYutzmKWVwicyiF8AaR2im//3M4yocoPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh7lkI/8Oty/daxRHEUpsLQiAVwuz5nSroHv6fAfWTnaSSnEB8
	rIkUlOJqUNeyfKu2hiAzINkZPZKg2J5s7JVsJUKx/sgcK3vM+tux4PcwF8WYCxrGvSJMFNCBfRw
	jNdlQvxioZrUUbs0jxGfPgOMKtek=
X-Google-Smtp-Source: AGHT+IEIA1o9HmWn6YZU01KInLt1ALprygAJCnPqjYakidAhi7RUIozLV04SGzZx1EmpG28D1ed6rEdc6UoVW2m5t1U=
X-Received: by 2002:a05:6871:b25:b0:25e:14e9:10c9 with SMTP id
 586e51a60fabf-2737eec46b1mr3111271fac.6.1724259452578; Wed, 21 Aug 2024
 09:57:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821071752.2335406-1-ruanjinjie@huawei.com>
In-Reply-To: <20240821071752.2335406-1-ruanjinjie@huawei.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 21 Aug 2024 22:27:16 +0530
Message-ID: <CANAwSgRzWGtPEOp29Jq8wWHE0BQcQwY-_tCAJQ1sgCA=QU3nxw@mail.gmail.com>
Subject: Re: [PATCH -next v2] usb: ohci-exynos: Simplify with scoped for each
 OF child loop
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, krzk@kernel.org, 
	alim.akhtar@samsung.com, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jinjie,

On Wed, 21 Aug 2024 at 12:40, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks

-Anand
