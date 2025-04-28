Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D03190072
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856470; cv=none; b=KkdLHDLai+ncLQCCuobw4j2bogcGNhq/kcEbBA+EBPm1bdsTWn3Mx9NQHajIsGLqpssU4xOY19dtmasm94POqpbKKX+S1cFYW+uFQagW32vRUCvqNu8UtNqApYjOaP+5IRSyTV99PoWpHlBU4r7PtVVdZxjJQW1XKCPOJ4g2yIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856470; c=relaxed/simple;
	bh=EicrIC19WAEeWMuLep/tExhmxJZcV0V/chCfiyO/yOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUpY0OtTxVhfVDveCtUu6eXwuf3DcnxuigIIE9J5IiDU5gy75anf27UtrJxBMdxk/4KuQw1GjKg+0VDwz1WDt8G7tSSHk6YoUxqMSqWHAHVqkEqKNMDXcU0H5e1K09YLUd2+uTjKX0VTbGob/H4bwRi/2rrOaRrf5vbpLVw38oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YiGGeNAc; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YiGGeNAc"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4607876b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745856468; x=1746461268; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sZqFf0pd/XIN1B2NzEquxW9LkBSgzNN2nMSHABe7I8=;
        b=YiGGeNAc7GhHF8tsJDBwRNElmM1rEby89gs3Tgkw9iCN9nztCsyUG3SlaoKSsGjh6o
         LON8tqkURoxDDXccUNHCiimnNsh8VFJp2zC0uotq6VfvtroJjnc/rfFYXY5USZFjIlNp
         Zd39WJ+91MNHBQwbaRqXvn7asSY2RjrHkyFPaw3iy9PrdCpd6l9X741Qf+NceAsZEks7
         C8eJGQypysijJ79nc089QJp0p4Ceteoqp7P4cQTXKipBWlEVhVH+hJytEJDnyIoBmzwy
         mXDzQ+zf3X62/fjDpfJ5MzEN4K2dxS1YJ1LvSEF4YtvR6DH2yE1oV/O77QI5kRk6kcdG
         dWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856468; x=1746461268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5sZqFf0pd/XIN1B2NzEquxW9LkBSgzNN2nMSHABe7I8=;
        b=pP1kE8eHXu5sDANuRWrGO1X17GxZBovcixppgWVTE4o8vlZ/oWQF7PpOdqZ8SSFVWs
         LDPCg3vY3MS/HQV1MDtVYvbNm7l4FMPR+LAZr2k3yOBLyuIuWNhYFDOhc+keGnFytPAG
         3MRFZEvCp/FKrdEL26DQMePQamvEolsMy0jI+vGcl0dtL8zMuK5zjZ4kiVOPd7TZqO9o
         oDqZWHH0mBEUISettguqElw5CvixahAonhD+k3yPiQbICfKfXJ6kS3RNpVghYZibKILL
         jX3x3uN5EBaet3pSbho7g0J/0ZnHTHEeSsajyU5yhWDMGOSbrr4malY8W3YsDu8yL1ut
         Pe7A==
X-Forwarded-Encrypted: i=1; AJvYcCVTzPpYH4DNZWcfj67Kdj1Smk3EfwCcZplmcm96d/NTl7X3bwtzObpJiNpbbw8IUZE21gEfUX0m0iVowgSs1ZaK1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyicGDKJW7OwwUd8Lo7ltixzmLrmsgaGcnDGYSgtxTHJQL48KKx
	R89GqLooa2MSuJY5HxXAM0QfZTkeN8eRSpvxkghD0ALsJowgEngNIc2MPC1+ng==
X-Gm-Gg: ASbGnctlq2QlnZDyH/IZfM0xIA1/ot1ENRCDzVZ8fQtvTMtS4Cgxmm8GUj61M5rgxFC
	STMdLOnuui8XK2RDZbIHMrUIe++4QQJ0y5WsoFfTG8hkjziROHVkU0rWumLrnnEiWwpFiU6OEs4
	1DxfBUNvykZ0/S/bNVO4OltHjvZp+S/iZWOhbCdIM3usmVoAuar69g8u3otESoy/P/8yNqzMFtV
	xV2/YCUsEA8mQchFllJur3NXMI7fcg0DG++7dWxPfyho4pSvRwVSZSUEr7Cssy5pZjKDbx6Tl31
	Vs1jUVVbO6CjnnXmL4G0SG/7komUSDdj41dqVI2N5/W5Rak37g==
X-Google-Smtp-Source: AGHT+IF0ND+g+mFXQq9lcsG6u5nnlgozZt0EphIl6/bHv3S/p1GH2+Y4vlSstnIZ/hRGR6y3aIC3NA==
X-Received: by 2002:a05:6a00:138e:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-73ff72d3d28mr12125481b3a.14.1745856468420;
        Mon, 28 Apr 2025 09:07:48 -0700 (PDT)
Received: from thinkpad ([120.60.72.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acc4casm8463484b3a.172.2025.04.28.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:07:47 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:37:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, 
	Paul Cercueil <paul@crapouillou.net>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 04/12] pinctrl: owl: use new GPIO line value setter
 callbacks
Message-ID: <ild3eqfgiez4zgtxcha6ki3udfxzdiqeywvwzh7rfympgfps7o@m6h4v5kxhq63>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>

On Thu, Apr 24, 2025 at 10:35:27AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pinctrl/actions/pinctrl-owl.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
> index d49b77dcfcff..86f3d5c69e36 100644
> --- a/drivers/pinctrl/actions/pinctrl-owl.c
> +++ b/drivers/pinctrl/actions/pinctrl-owl.c
> @@ -598,7 +598,7 @@ static int owl_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  	return !!(val & BIT(offset));
>  }
>  
> -static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>  	struct owl_pinctrl *pctrl = gpiochip_get_data(chip);
>  	const struct owl_gpio_port *port;
> @@ -607,13 +607,15 @@ static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  
>  	port = owl_gpio_get_port(pctrl, &offset);
>  	if (WARN_ON(port == NULL))
> -		return;
> +		return -ENODEV;
>  
>  	gpio_base = pctrl->base + port->offset;
>  
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  	owl_gpio_update_reg(gpio_base + port->dat, offset, value);
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +	return 0;
>  }
>  
>  static int owl_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
> @@ -960,7 +962,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
>  	pctrl->chip.direction_input  = owl_gpio_direction_input;
>  	pctrl->chip.direction_output = owl_gpio_direction_output;
>  	pctrl->chip.get = owl_gpio_get;
> -	pctrl->chip.set = owl_gpio_set;
> +	pctrl->chip.set_rv = owl_gpio_set;
>  	pctrl->chip.request = owl_gpio_request;
>  	pctrl->chip.free = owl_gpio_free;
>  
> 
> -- 
> 2.45.2
> 

-- 
மணிவண்ணன் சதாசிவம்
