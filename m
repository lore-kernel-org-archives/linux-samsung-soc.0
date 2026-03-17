Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29A3603C8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2026 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739822; cv=none; b=X1AwMAThRtvQ695qPNLBvPnisi/b/nqmGDUJwe9F6lPZjDgNAIhuwwk2FN4w5nwLluSl5RoyLajiMY/WahApe6RGrOdwIQvGxQQF3WC3y/8STvlJ1SUJ49uNSRkg2ANC+9QxE+Ten6ObKmqwCeLmWoRKs+G2XF2UgooWaItui70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739822; c=relaxed/simple;
	bh=n9yV0EKW0ePeyskDVcCg/LnzxUaGeegIs/HWjeZnKec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZF4wG6rTHZQCPgdmXgF4Mbw4jRRSC+J9QJOnEKKs8D2DSQlA4ctkXDoejCPdee3ERzmqTXQONrkhFFvjSJh/4aFCGoEXWV8G/Z+P5I0de3egfB9RdvGE2ThptNKQwJhZQCCdLE3fmS5rl8PjffJy7FmydyKZpqdPtg8dV/XFB6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IW4rO2Pk; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IW4rO2Pk"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so7540589e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2026 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773739818; x=1774344618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1Y0fq+nOdX5B9Zlv9rWb/FlWGr7tCSJEoVxQK36Zz4=;
        b=IW4rO2PkNtgphTIcWlL8DIP6D3aL7IKTyxWbQas2ydbJrfk0aiB9VU9w++L0i5DDex
         pZkOdYH9HpAHjOWiy6me+EDVYIJynnXCOyx9DvcWvJtOArvI2w1oOopeGlqCKbX5M1WV
         9Ehn/DfClD19/xyAgS4xTUPxULD4czvm3eGsDorAejH4P0McO9tElTn7ezp2MFkhcMal
         AruVwCkrGQTuSbyKgP5Z3qmlONEDVqCaHUYN6VVPNJmhmN0gAObTB9HhxeqdZfkZhpIF
         dnj3Y8oOXYsx5+vzjczOQYDWImffQqL4155OkwsR7mDDOpJIoS40b4gEUPQHZp+atrUm
         +6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739818; x=1774344618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1Y0fq+nOdX5B9Zlv9rWb/FlWGr7tCSJEoVxQK36Zz4=;
        b=OgxrzaDC1gzMrk7gJOtUXz40K4hqvMcjB3cutfHHOJq8HP50N3ex9PvpZARXNjIoCv
         H4qKzmTTAtKMDl6FzKSZTfothyFMYDsQP42pHHaL4koQVY8Kk/qCm1bT5HPuGe8o/c2E
         zxwuH+qsNhi133Ica5390ekqxNvNt0DHTKLFdWe53I1+tSUg+WdZISypaTmJ/NLmlqEG
         OuedxwEI+yUSxzEw7mQMnnYb2GOaC9Ne/SEneZVGv/Q/3tCIy+udah0bziYMOgPFfEuN
         YJ4m6YSxvivUe9zo92/gjGEQV7e7wCN4ZNhR9PikpVqlFXu3zlnaIhZT2MLoP+4H2hxS
         mHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx23EQ3MxSKOCfYZwOfOOd+Ko5rJChzcozgAl0lFKHvC1R6yKWLeAwpOnaAhF5shtah5/aGP/SGofMcRtkCLT22Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5a+8+Hgmr+kgF+6+K+gu1vcWMTVAmXPUz8pbpFryyNZTTY63d
	ZpbR//ow8HGKyzi5YwSdWVBR8Q5TxH/V2m3bYgENc/S65Y2pTyUE9WHsj4nWcULv0ow=
X-Gm-Gg: ATEYQzzgqPgDmfqe5TBJ3QPGrJojdFSugYOq1XTzH13UshDglrC7iGgn7M2gkrF05WV
	UIULBRPIqwG2wsGzLvO7PqUGSF7GUz9lCOZoSBHAjdvHbeFTe9kTqaYHgzeVIT9JTvtXiW16K3d
	yjtuhqFC5LeAjYeDcJ0tbZCbaKmoKCDZhY4QVDkLCTnWonMt6b8BnCaQv5q4BuXbxp857148nM2
	f30AiPQF1vfPmvqWD6ValBWsEIB81helvDIanFLX+IuWzaaP2ApfkTur/UQ6fa8ARbrsXbvr4NC
	5g1uHARLlSvFg95ZhESxcVfMp3moxHnPA/Zhk1wI+Jn4JoDt6oYA44kaad3AYJMXFuz4AC01XD6
	LBNlTcw0Z3AqbyKD1xm2xAqb7wNT80+wftt6N4PKNr8Mjs/COGYNZgRAzlMbbLaBkrTj4XYkzDI
	UOYRDfqY2d7RcTwZuqgY2At3fo0dy2hb/vXkx1S7SCH13rF+K12IAt5GjA
X-Received: by 2002:a05:6512:31d6:b0:5a1:3e11:2963 with SMTP id 2adb3069b0e04-5a162b13fe6mr5199056e87.39.1773739817876;
        Tue, 17 Mar 2026 02:30:17 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e713sm3977671e87.32.2026.03.17.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:30:17 -0700 (PDT)
Date: Tue, 17 Mar 2026 11:30:14 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Arnd Bergmann <arnd@arndb.de>, Heiko Stuebner <heiko@sntech.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Alexandre Gonzalo <alexandre.gonzalo@arm.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/9] scripts: kconfig: merge_config.sh: use POSIX '=' in
 test
Message-ID: <abkfJsyQSbW-VjxD@nuoska>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
 <20260317-arm_defconf_cleanup-v1-1-8eecb7fdd24d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-arm_defconf_cleanup-v1-1-8eecb7fdd24d@kernel.org>

Hi,

On Tue, Mar 17, 2026 at 10:13:37AM +0100, Vincent Mailhol (Arm) wrote:
> merge_config.sh yields this warning:
> 
>   ./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator
> 
> This happens because the script runs under /bin/sh but compares
> strings using the '==' operator, which is a bash extension. The POSIX
> test command only specifies '=' for string equality.
> 
> Replace '==' with the POSIX-compatible '=' so the script works when
> run with /bin/sh as intended.
> 
> Fixes: dfc97e1c5da5 ("scripts: kconfig: merge_config.sh: use awk in checks too")
> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

This fix is already merged in kbuild trees:

https://lore.kernel.org/linux-kbuild/20260309121505.40454-1-o451686892@gmail.com/
https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git/log/?h=kbuild-fixes-for-next

Cheers,

-Mikko

> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 735e1de450c6..073c6bec5245 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -381,7 +381,7 @@ END {
>  	STRICT_MODE_VIOLATED=true
>  fi
>  
> -if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
> +if [ "$STRICT" = "true" ] && [ "$STRICT_MODE_VIOLATED" = "true" ]; then
>  	echo "Requested and effective config differ"
>  	exit 1
>  fi
> 
> -- 
> 2.43.0
> 
