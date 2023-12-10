Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBZP7cvv"
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EA5F4
	for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 15:34:28 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d0a5422c80so33849775ad.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 15:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251268; x=1702856068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9inBJnm4RRUBTcM8clVN2K31CIq5Yi4neoBQMqj3lw=;
        b=SBZP7cvvFTSc9dI5gyrQgoKBpoDkSuyp74A1pRYFlCFK/YJUOCZ5McPZ/cpAWcESW9
         NgEJ+FvXNkbdUxyqNcj3NDey/amslkAKWQMymlPDaqMGsoAjCr7HArraw1C8EsTpTU0A
         vR5+v2lq0vQ81zlLU0SDHqneUXN5tOuiwn3kEMfDCLem8VnGArqo5yKh6WJFKPfRSthk
         TbRd7Gu57v8oCBcZJvu1UOysWTt+VO0jAsbcXbaKf0zAC7v/Fn8IAyXypjIsHeIGd640
         o5Htg9Pe9+3Y8oBxx4+DL2sKIVfYIBthnIAOoSBv+rWHwJ7vFHJWTU7vT1vT19sX6SGk
         iOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251268; x=1702856068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9inBJnm4RRUBTcM8clVN2K31CIq5Yi4neoBQMqj3lw=;
        b=v8tort7SZewZdGFn93YY+BfKMy9QuFw/19d8LsVk+m7s2wnvR6HTUa0t4ip1jGKCh7
         1/t7vWmRcr2or3l5Cfs+cdozJe9wdY3Rb7tampuF9+CYMe6/474/IYYEZZ8P4AKqNvUy
         emwEDp+1InRw7H3PE4Jg36QFL+yj4bIOWVJaHdT5qGXp73hD72zm4F8FNDKas+oe5oxf
         XUhBU3FgxaPhucn7fZrwAsxy6+o9+If8JGfXyxwCfYKYNm8veXZJ5PmZ7tUobwi5kLNd
         Xel5Kuw9b/F6KsgnKOvcGx9vGbq626GQ2SsV4v23LzcMcS3uhnHC1nEYBGPcxj7Gg6Un
         YYzg==
X-Gm-Message-State: AOJu0YyBYwtV9sgk9PH6uO9nRzAv9ldfLQaV05d24YqsIx7EkGWRait+
	agugdL7ACwPXWxWlCDBsWrdwLO1RREvbYkUvfNvasA==
X-Google-Smtp-Source: AGHT+IGc+IvHTENHJ/KXFFp2iBYPliL5WTdTBJgCg+tz9DwtfoGQRHQ4N7s/di11rwfak1O7RMTB2P48Vdkm1Es9RHA=
X-Received: by 2002:a17:90a:94c7:b0:286:7f04:23c0 with SMTP id
 j7-20020a17090a94c700b002867f0423c0mr2376721pjw.4.1702251267601; Sun, 10 Dec
 2023 15:34:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org> <20231209233106.147416-10-peter.griffin@linaro.org>
In-Reply-To: <20231209233106.147416-10-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:34:16 -0600
Message-ID: <CAPLW+4mztK2HEKh5S--tdi0p8i5sYOHHBoTFnfH=9X+vMXxOuQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize a required property
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

On Sat, Dec 9, 2023 at 5:31=E2=80=AFPM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> Specifying samsung,uart-fifosize in both DT and driver static data is err=
or
> prone and relies on driver probe order and dt aliases to be correct.
>
> Additionally on many Exynos platforms these are (USI) universal serial
> interfaces which can be uart, spi or i2c, so it can change per board.
>
> For google,gs101-uart make samsung,uart-fifosize a required property.
> For this platform fifosize now *only* comes from DT.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index ccc3626779d9..65d5d361e8f4 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -133,6 +133,16 @@ allOf:
>              - const: uart
>              - const: clk_uart_baud0
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - google,gs101-uart
> +    then:
> +      required:
> +        - samsung,uart-fifosize
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.43.0.472.g3155946c3a-goog
>
