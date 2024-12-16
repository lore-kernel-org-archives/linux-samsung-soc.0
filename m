Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B14203D42;
	Mon, 16 Dec 2024 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734359247; cv=none; b=Ly9bTuYGvygoxXll7evnG173ncTiEO0q/g1okio0gLf10EQYJJrlJd03/Ezf65LRASd2VAXkTQar9e8lJxrhZsmRzeBkafRKW/ZflO4g8zjrvSD8twzZIVzh4Eo03UEo+s2bAgVZMm4KN/cnfAGI8R1Ez8hZD0JgryeswNkBrF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734359247; c=relaxed/simple;
	bh=Mr35VqwgweA69AHCsQwnqUK4U36oZgsI7Vqv1GiCVuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ8rpfkP38GaGbnkwjKrud0eDFFD9lHS60eFZ7iygEeaZLZqL4cxU7s+GgMbyTVQaVgXEhQJ9IrNV4lr2VM/PeCNywcLhzjHK82iTA9vWrpaggcjHbBSjGoKTYbSxzUf/UyFbQ8CsmyQvQcvxszmaoZ9+Av9+bB2EDWn9hJ7rx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fro3i912; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fro3i912"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B13C4CEE0;
	Mon, 16 Dec 2024 14:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734359246;
	bh=Mr35VqwgweA69AHCsQwnqUK4U36oZgsI7Vqv1GiCVuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fro3i912XCn1bOY2tqDZK1/F3kQ08RLKElLPkKR4AjpKHSvzjQNUBV9O5tO0vePg7
	 etDP1F62WwqhGNXW6m5w0/wQRuyaAIRyTUKWR8lQiqGi5s15IQAH5/GN468+K/baS+
	 Ym11OmhuaeXJk76uyVqFFeePTsyEsrv5ZZs86x3Z9nP6qSWkpQU6Bp7ok4Nqyzs50N
	 WLzw3jddrXnlZA1cEYo0Bei6COMdjRGpJUFd8OeRayx+LzRjLIIL/wOBfJMI2veFMV
	 EZJd+/wdLl1fEynZhgx0fCRFB8VVPuJ/5m6G3fCU64sTC9Uz3KQoLTk/k38U4mhQRL
	 2/8eSjDm11WEA==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3983f8ff40so2443715276.1;
        Mon, 16 Dec 2024 06:27:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhG4fxqNdWYnJVjqzh9ALctqJVziizuoG+wFj3NozdqsdHiCuBE+Jd42QsTvu93xPIFnmXn5pHl8b3IQc9@vger.kernel.org, AJvYcCW8eNph5q+UVs88SqNAlOzU2Xg6wNryGzHfF6jiB297AvLiX1lHbRuofxE1067SfwViQqeo78BUTKtE@vger.kernel.org, AJvYcCWJbEHQSIp4Ae0gQYq+skzukTKwjS9ne4UexJcyUlcSiTeI4u9pM+OzjJItcKTbUdFP2qT/mgO7baqabzBe3/+gMzo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhb+iq/5TtT95gJ7Yc76q1oztqawHWBxvcBd7NGdlIYV7Nlz1N
	hIIcolm1J4mQu/43t18k2Xl+9fe1IGZtrA7n5JXsiY+KHChE8c1KxBw/y0VO35az/P3aJnkISsp
	jMFSA85MLi4OEZVij8hy5yBqvaw==
X-Google-Smtp-Source: AGHT+IF+SzaoPtVSZAlJvWgwFl8E44ixi6sB1aULDbhwrV6Mys2MrEPY+9ulABzQBZn3pK8qf8Lpu1q+VL/7Cde5Jk4=
X-Received: by 2002:a05:6902:72a:b0:e3c:7b6c:9d1c with SMTP id
 3f1490d57ef6-e433f94c771mr11142194276.0.1734359245885; Mon, 16 Dec 2024
 06:27:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
 <20241216141846.GA71151-robh@kernel.org>
In-Reply-To: <20241216141846.GA71151-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Dec 2024 08:27:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKNZGwgd17q4Em9-fdVLgTsjLYnVHEXjDcH+i60b1ssdA@mail.gmail.com>
Message-ID: <CAL_JsqKNZGwgd17q4Em9-fdVLgTsjLYnVHEXjDcH+i60b1ssdA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions for gs101-pmu
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:19=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Dec 13, 2024 at 04:44:39PM +0000, Peter Griffin wrote:
> > To avoid dtschema warnings allow google,gs101-pmu to have
> > two reg regions.
>
> It's not a "simple" syscon if you have 2 regions, so put it in its own
> schema doc.

NM, I see it already does. If you keep 'syscon', then 'maxItems: 1'
will probably need to move to syscon.yaml.

Rob
