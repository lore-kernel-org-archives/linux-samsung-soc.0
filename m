Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C2827C172
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673628; cv=none; b=E7A8RuppsJfp6+hXiMVyv/T2NtKXH6583rZPGuAcqEqB+ajTQQV4CBdcGOJq6smti7p2SnfApVJcYu7zNGy5CKBCmhKUnRowGpnlZj7xHX3/de6n7ARbScpmtLsiY6FPiyC+8xLbwO93rjVci5pLJhi7pN5rbHw9kkqSfqnl26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673628; c=relaxed/simple;
	bh=3e0QDJ5KbEQSENJLgEWoOKXZbyZ1RrVyN7WOTZvbwFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rg686rkcZxn9QMPJVVxqxIwoNAdHiKZbTADVODlkkQmcfGUAh4dxaruPll5P7g7juLJ8vMJGXXW/ozyT5nJfRScndZtqokkSipRvoRySESrzhHU1y9JRqURhGNnXsFKJaoxzZC/fUO6K5rVsM7e0BzrE38wi/Q5pfqo9Wq03v5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wpec/RD9; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wpec/RD9"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-61ff35a56d3so924582eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757673624; x=1758278424; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3e0QDJ5KbEQSENJLgEWoOKXZbyZ1RrVyN7WOTZvbwFo=;
        b=Wpec/RD9qi4TbGQy3FJL1NA95+USMHmuMtbEHsw7oAhhUEYMS4urGz5OrcIxeEIrAn
         2a/BibT7iJtbHbxMYqn2i5IlUC2aXIVx7OaMabZzZw6kEil0SMpXoXfSX+H3iw0JJzL+
         9luibtddZn9SwB4f3Poqzhvh6pgbGlvOzwfG9iF2d38mqL4vw5sdnX6yFrQYXz5bBDD4
         hF33YdF64eDbjEF0ly0m+Zd5tl3NtDbkzpCAYlDyURiyrfnBG5bFo1Jv6/vrCqvvBMSH
         IdKT40H4Zwg5ynbNmByiOm0tuA0354YVoHkt/mHI2Lg0eIxoOD91uulP9i881j+EXp9M
         3SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673624; x=1758278424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3e0QDJ5KbEQSENJLgEWoOKXZbyZ1RrVyN7WOTZvbwFo=;
        b=SiCR0zyImGq8sRiTMYhoc9cTIDwjXK4sdpeQJk0Phg/5DVvO4S21yWG+Frgz9zWBqd
         QIZ2wK3eEmb1qeiJd3b2RI8gemgpZY9po0sqK/uNgCidMIEeO/h5nVP04AKeV8OPpynx
         DU3kgD94C0CpjFoZ0IV9w1FTHyFjAqS+SyJwqtlGGvEBLnu9ppCffIOR11YH1HcBT1xn
         c57+PVvpYkhVz5UaK0YmAradNkk7fINpF7lF5x4ri1ui8DDyJSFxPrBMWfU8ts2i7YWS
         Ncdj3LzPBdINxBVVbQvq1bIxxOpcy1AE3rzrl8gMjFxao920uLvVglcKwc3A6f406Mir
         t8RA==
X-Forwarded-Encrypted: i=1; AJvYcCV3XzzKf39RWeS5+GBnQV0Q9ocnMyyCDIs2dPgAZEL9bWgOYlzdOesNop4vT8X9H09tYat1u7MgDBM/vifbYfD8vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNbMiItCphvJ+Fhz52UGD9SVFdbRI6Xjf2OhwIRR2vkkVCkSp
	thh5Mb+B9tu13IaLCQPO9I/NHcozZroH5sXqUgfmf17v0soNcH1n36gYUZiaPzLbygucZpiGmqy
	qovkd5MYFTTt5EMCXjLosJa6b4p2+sPNdEGEgQvNqIw==
X-Gm-Gg: ASbGncvXe7aJhEQWjXEW/jjJ3qSPFhb9WxcWzgOsx2mI5lO95w6HxdyzZE5A8O/yPN1
	4AIns55HMyAVEF7hqkjEmcMYuz3nDBkBd2klPvbX5QBleUPYa3C64TlPn6WaTpVyyWjPu/G6Oov
	J4+nXreGXNKzE4xxLj/5cmnquUqtMbF0LWdfvTIQaIMzBdkUXIS+5NnyoOEAnSPwrx7eHxpEpxO
	5+R7ZEMdI9JAyLQIg==
X-Google-Smtp-Source: AGHT+IF6PYieNgXpIa6hYHoBPz39MBN51Z0tSk5VpF01b/bxMjrI+5a5IB+fKLhWJ9leyknO44l7JDgMdXYIXbH0W9U=
X-Received: by 2002:a05:6820:553:b0:61e:154c:5b01 with SMTP id
 006d021491bc7-621bedb8f94mr1279631eaf.6.1757673624624; Fri, 12 Sep 2025
 03:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be> <20250804-b4-gs101_max77759_fg-v5-3-03a40e6c0e3d@uclouvain.be>
In-Reply-To: <20250804-b4-gs101_max77759_fg-v5-3-03a40e6c0e3d@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 11:40:13 +0100
X-Gm-Features: Ac12FXyvumHdbJffBuyBixni6c5DHFCVdSez0KdSftksCT_bGFTh8Q4itCgi8Pg
Message-ID: <CADrjBPoA939OwErqjV4OT04hgAfDNgmG2o582Q_P6CN6iWQgCw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] arm64: defconfig: enable Maxim MAX77759 fuel-gauge driver
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Aug 2025 at 15:25, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> Enable the Maxim MAX77759 fuel gauge as it is used by the gs101-oriole
> (Google Pixel 6) and gs101-raven (Google Pixe 6 Pro) boards.
>
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
