Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="It/jmjCg"
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5267510DF
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Dec 2023 12:25:25 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5c21e185df5so697547a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2023 12:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701462325; x=1702067125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srxzfUuXBFkMVOn7OGaNdyaL+KSIWUVGXnTpFNQ9fis=;
        b=It/jmjCg6qSzDVE/pAJ6hEk5g1Fk1ppJxx9o+8N5AXfwTq5UWAC/14YXIwxAD3lwnk
         hW9L0wQ0HqztDtqBVJqqNGEpHVbnTdztR7WJ4GaYgarjAMorImA821lSHTQ4pPAVJClU
         VLbM97OlE235JQY8pPKCF1pN6Zha9bkPKjP4dwiN25tXGsyEiSGQqsKDkA9ODuKykJ8a
         VTYTOausGpADocJzHiKdunmthVmGPmJY0i+HLtwE41u+geamXwxAMAPZyggVRhTMW9Zg
         Z/w23fM7wEA7yaTw8pqgD+0UITZzFGvf7RoM1lWtT6ZkFQcVmz2TMeDp0V6PfXidbSWy
         x6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701462325; x=1702067125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srxzfUuXBFkMVOn7OGaNdyaL+KSIWUVGXnTpFNQ9fis=;
        b=Cl2Q6qcmbzIqMRL6HgT3ZyhlujqolZ5lzIHFuNWiWcHurHwxOqw8g/xN1HHNdJ2H67
         OK65Egh28W+8PaEKdLpjwEt7o+Vdef2X6nanaU1jorQ+LaOq2VOY7qoas9Xuckgn0W6U
         LBg8laIVx+lvqtlo3YN2kvvg6lU5Zu3okpl2hbXSY9rjFiK+2GlA6bb5wk7MA+yWaV7L
         k2letF/vQL4NfEgoUeP+Q3rfxj5Yk5iVKEIX8Z6vnFlS/JxQ6JsHSLDTMcBB4I0sHFcp
         wpJILJ8m0u73rS2bo7tTGiltggaMdmOZ4g+W/j4lEzFp9ElIUL3ac/eGjFYebp5eD67y
         7+6Q==
X-Gm-Message-State: AOJu0YxGQsQvYMpKuEqDMEYrIU6tLs2xKYRecjOTGir6Bq3JAKAGrpOt
	CdhYB/b8JEW6HBDil8F18LLcnF4mW+RAuFZgQsVuFA==
X-Google-Smtp-Source: AGHT+IGhcjjItpFP1S8xXsF49mbnFTtcjlU4G86zhv4yaAeBkLj2OCa5brrLkR7NmAsB4hi8jkTN6iLwfS0jbWLoyLw=
X-Received: by 2002:a17:90b:4a92:b0:285:adb0:de3e with SMTP id
 lp18-20020a17090b4a9200b00285adb0de3emr93998pjb.34.1701462324828; Fri, 01 Dec
 2023 12:25:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-8-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-8-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 14:25:13 -0600
Message-ID: <CAPLW+4kMHhh2++F9pU3VSxBo9H-r+79XB8eSc9yi+DR48C=8vQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:10=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> where more than one pin controller can do external wake-up interrupt.
> So add a dedicated compatible for it.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wa=
keup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pin=
ctrl-wakeup-interrupt.yaml
> index 2bafa867aea2..de2209f8ba00 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-in=
terrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-in=
terrupt.yaml
> @@ -44,6 +44,7 @@ properties:
>            - const: samsung,exynos7-wakeup-eint
>        - items:
>            - enum:
> +              - google,gs101-wakeup-eint
>                - samsung,exynosautov9-wakeup-eint
>                - samsung,exynosautov920-wakeup-eint
>            - const: samsung,exynos850-wakeup-eint

(to myself): I wonder why exynos850 isn't in the enum above.

> @@ -111,6 +112,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - google,gs101-wakeup-eint
>                - samsung,exynos850-wakeup-eint
>      then:
>        properties:
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
