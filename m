Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063234;
	b=n/7wlYZHRyUM9JpnI5Q84+0LGVu4osCHXjFxrDjAN+c5LT/f5s8mqCN+p4UkH0vMwpvZ
	 dz5AJUr9rilkii5/aFYaZTtvDYM4Nrd/XAopCZvOlpFEWueQxQt5FtaUNcZCqQ4Y9qgSx
	 zeTJcf0SO5C2JlVPHTosbdchX1cj+K9gOAyjqEa1rJetD6PYQ63IiYOZtOjatbYxeJvA7
	 ILWFVKjmNDhZipAentb7HgPmuEsWbojY7d9cl1mmPdVbgxLnjkhgyRsjX5gO0vKIG39d0
	 J1TT0KH2SAUx22aMb9gEJq/QaTdIq/Yt1z9LnNXsh0m+fJXUNhNeCu8swxNfeE8Y2EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
	b=Vuga2dlGS0ywh8WxISbsseZJCD6kcI9uIqEeAnTZk5rt7CG50hTEI71pYJZl4wbNS0Pl
	 eSrs436XBvJd+Y3XOfQk3bGa8hVOX2GwLdJj5O0Lhm4UIry2cCNmLlqGZrmvzSOoiRJ3M
	 lF1MWgmOvyZcA3kLmxgD/gJAEGFT8fW4tScjcizfT3YSGMEQEKh6fWTEyTZEcBq0FIaC/
	 dXTsqS1WV7x94PamG3Cd+0Vmkj4jrm5/2gjrcVkll/uqElBNp/H0sLxf7Y70C80r5v3f7
	 V/I76N5MMYK8AQXqCroLLIqMVgCpO5wrMyLzW+I586jhP9+xO31v8vhr9vf/LdaElCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PVYnLtwm;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A727606A31D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 01:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A727606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PVYnLtwm
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35829219da8so610673eec.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793063233; x=1793668033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
        b=PVYnLtwm70tT95O4Uv7YMB8Et9uODxOHNv+T6a3NrEqKIDvU4e5NW/3X1s/nZW/eR1
         miRhvrwaPJy7I+3t/q9nz3y5ghFBQXE35M1yzkRI/SlelyVbU6s8eDoPEE4VX6YYskfY
         eebLieAqnTfWJBwzDQxr77P1M+U1A/gM6Re54SHmAi2WUA/yBgRCHtkgLeZw8Nh11/Eq
         6rbUJo0nKwH7PjFGdf2H9601QL5yOKS1Dprb5s0qOo834w2oy4EO86MunCM5F6caTmNK
         HcoLVCojp3gvIwrCmy9u1ZnKNEBeCkTGnQQfVYsirAe3vyrl8uvhwYFS4rA7AwlRC3Zw
         1+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793063233; x=1793668033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
        b=sJi2IfIFaU0hgG0Gyg8Zvl9jXw0wEg0Dcno9Qr0JxhpSxY1xXhq7a8tN+eo8ezk1Vw
         XPD3wQ7uDYiHEUmqS01uFMI0p2fNbnGLAO+ItQny8jskBK/yZwlf7UB2jibWycZKxrIS
         z+e8hVnPfMJWZfJ5MwhjUvm+XFcL6/GFAeapDJstaeHRYv0YUtaWsRm3+toj+iyI+/zg
         kCzFJiEe3K0pXCiMHgxhCFxNwTwD9lJChbV2nOkIYKAF82is9ndBbt8tfnOysUqsAvOx
         9hcLpURVwlbV202ypAiQhAMYUkjMB/rXZSI4J0HQeaFD/WOJ4voA1NAkYqbAENQ1j0ps
         3hoQ==
X-Forwarded-Encrypted: i=1; AKwUvByuExRwQkdB3EDZCKG41tdj7OamCUx47l6pn+0HB2EfK1pNCla/hPRdPQTkIQ7lVeJptgnE1OUW8joRIUMQP81big==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0+wTbwYWapIvxhqRYJRg3TyC9dCBxCvONcPoVSNn5oeIPQ6kh
	4acI0Gpa2MANAleONuEO5DoLYFG92NNG9qWV3Qxwp/uYzk53Mz/Qxrd9
X-Gm-Gg: AYBFou1NSn28/PDZoOhpC9bgb1zX59uZqICK0tb1yn4/xem3bwJsGZQNg9Qhb/GYOIc
	zXKZS0hxZE1BhiClZIz/CVr+r27cROxByeAOuLRYzmPOvA8icgg1E9zUtEw1hPUD+GKSUKXaSOi
	M/fc8mcXaPZAgBNhMJZFhDCUAJeVa3A7hIzOs+jXqEjHIrgSyXRV5QT/sD63GRIUKEE17I2m8HN
	jlUPd4NLqcVvxKheVGrzmvY/UjrP/teOeH/DHnRAr+iJ096pPC+FDMgzUNZIB4MwTYn3PLodUCp
	tSBrk6ohQgvpfU6RQjVRBi9hY1of+rmMEYUfWJs8TFoIuZAiotVrQdPmOdRTLEJn1Nfi3MFwtyH
	hFfVPDZ25VW2FY+g7BtKyiW2+I/CzaAwnExvHWX5xvMxfScGEUmGI/0J4gcrS/b+VL5fEudszhq
	Wt8UCJzRSqUspsje+vaQ6DV1j9xON16eEdFUanQdOIHuYWhGUMFTyKsE+n8cl3z1Jw4dnb7JsCJ
	uF+czB4aYxbQ8A4YEZPh8QjDppu6U6Ptyeu4U3T95AdCeLpFnmJzE1TTlFicn7boBS0gapqmR7h
	weyK9LY0DmPCXJOzxdeoH38=
X-Received: by 2002:a05:7023:c013:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1a3c485419amr1593552c88.12.1793063232714;
        Mon, 26 Oct 2026 18:07:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm27239759c88.3.2026.10.26.18.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:07:12 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:07:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Message-ID: <at_45tVmsWaYAv7W@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>

On Mon, Oct 26, 2026 at 02:51:16PM +0100, Arnd Bergmann wrote:
> On Sun, Oct 25, 2026, at 06:03, Dmitry Torokhov wrote:
> > Hi,
> >
> > This series converts the Cragganmore 6410 board to generic software nodes
> > and device properties, allowing the removal of legacy GPIO lookup tables.
> >
> > We add software node propagation support to the wm831x MFD core to route
> > DVS GPIOs to the PMIC regulator, and convert the peripherals on the
> > Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
> > from legacy GPIO lookup tables to software nodes and properties. This
> > eliminates the legacy GPIO lookup tables on the board and fixes incorrect
> > GPIO chip names from previous conversions.
> >
> > Hopefully Krzysztof can finish merging the series through the soc tree
> > once Lee acks the MFD part.
> 
> Hi Dmitry,
> 
> This all looks good to me,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I'm a bit unsure about how this fits into your wider plan, i.e. why it
> is helpful to replace the lookup tables with device properties in
> this file:
> Are you working towards eliminating all gpio lookup tables from
> the ~50 files currently defining them, or is there an immediate
> benefit to doing this one in particular even without the others?

Yes, I would like to eventually remove the lookup tables and rely only
on software nodes. How quickly I can do that is a big question, but
I'll try ;)

> 
> Do you plan to also eliminate the uses of the legacy gpio
> interfaces in mach-s3c, e.g. the hardcoded numbers
> in {pca953x,wm831x}_platform_data, crag6410_lcd_power_set(),
> crag6410_machine_init(), or the pin config in
> s3c64xx_i2s_cfg_gpio()?

Let me take a look.

Thanks.

-- 
Dmitry
