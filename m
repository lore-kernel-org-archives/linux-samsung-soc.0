Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45526D4C9;
	Thu, 12 Jun 2025 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740728; cv=none; b=B1d1jcXXLNlSs5wTxA5e9W0n9aawnZ2XpyvYhXdwTHt2jDAZrGLDT79Grktm11bbeM7tc+p/hWKKva92opEClbGkrVUIs6h7AAo1VJjRbJsECQhwCqErVuSRd26jEdnS39icZTCSdEmopV+oaGFMHtw7Ikpe59t403YgTizp1gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740728; c=relaxed/simple;
	bh=FrUyFoeakZ/6ELmKkHRpIQLhoYY54oaCXbP4semewDk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lOL+VTMQOFrjHt43JTNmuI41/ppszWTSj/YHubQnwbb10XWCVbYcm+E4KcUFqttL2bPgtf2akZFHxMZz+4/F48jboi+5poybcMZeDgS/ZMmeQum3dXQEd3Y0OrnBTRWdvb+f9EBeXLerm90udO2m6ON9wkVKTPed06gIpfZkL9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Jm5Tqtx+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JVD8+Avq; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Jm5Tqtx+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JVD8+Avq"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id D44AA13805C6;
	Thu, 12 Jun 2025 11:05:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 12 Jun 2025 11:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749740723;
	 x=1749827123; bh=F2brnDyX2RdfWZaowl+U6ywciKsVMQieC6WvQHg1iV8=; b=
	Jm5Tqtx+yk1k2lGRaFOeo2qQR4+VMyseQTEKG42iSTo9P6jMwKWKxgQ9Iwqk6iI8
	lf4fGeCpzFFE+CgHlMxYSKP7zDq3J0XJU5nE3OnUbiUXlQNC9rb8DH2Oy3ZX5JcR
	0NFR3yQVoi9d+qzJyiSgmqMxE8EJp5E1Rb2JejI7NSlWJ4Jrn18wiLF8okqYWsVa
	RXMQrTG2ZS9n4vnc/LqLV5cp1n4H6Yyg4GQZ7HWrboQo3Vrsf94Q3IiSeDn1oFRQ
	7yMjlxnr4iej+yMzGhOfwJY5T2QdSwL0ut1df66NsRC11gxZnzSi/3r+F7qa02ZJ
	aRP74315z5Sz3fwtha7yUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749740723; x=
	1749827123; bh=F2brnDyX2RdfWZaowl+U6ywciKsVMQieC6WvQHg1iV8=; b=J
	VD8+AvqEq1VJvmoypW5EPfC3mFllRnFuJEfEg4zHvXlMukjVmaSZhryCTQbm3eaA
	0Fh1XLNxOMOhIWizIcdPuTeoA4MktyLzHHdnlhpx3ostDMYmEocxybbp9dHl6qfN
	DA0/06CZPn/GDkq6ZDNm0U4RxAnktIvU2GA9jXGAvfT8GzpW+w68gNtkQdz6D/Cd
	KjI8ayYWSu9P+dHHezgD47utUXkDoEQQrAtvDw9xBzSJduPsz/6ppYVwz3VnrqC9
	Cl2OoM/RSaslVa2HtpTZWoTlB/h1sFP9WkMSvOGdqjF3R0ehRw+l6iKc5c9xpvLb
	UKcROEiF0juumr9gIrtug==
X-ME-Sender: <xms:s-xKaH34P9m8uz7hV427SUVGaDNUksqr_CYe9SDRYAHlDcO9vnyodQ>
    <xme:s-xKaGE3r7qLnHcKobFcB0f3aQZuhWhKHKLHHKEqFwDl28BUN8EpOcenxen5G2urQ
    0Dm-xaUlEnI6fWY89Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprh
    gtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskh
    hisehlihhnrghrohdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieek
    khdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhl
    ihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshgrmhhsuhhnghdqshhotges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:s-xKaH4SKAslg6GaVk3KwslqGGvlTgs9tgucsMNFsvLValYWOnOmlQ>
    <xmx:s-xKaM1_uFV8rVSaGmZtdIio6EoSJJr8B3qXjtCAu64uAPCFj3L6TA>
    <xmx:s-xKaKFcoBVn_K_jB5B61X_GRyU0rPYMVnwc0v4jMwnMUleLRlCsBQ>
    <xmx:s-xKaN-y0st34moHmInI4RYu2-ubKc-ELP3A2tpmXDnj7iR1jrQnkA>
    <xmx:s-xKaF9tXKePnpmYLrwW5E9xrOPmpcVk5d3Z3GQFRQ9tqykg9UqvMB_n>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 186A0700065; Thu, 12 Jun 2025 11:05:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T0983471eb64d6916
Date: Thu, 12 Jun 2025 17:05:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>,
 asahi@lists.linux.dev, linux-samsung-soc@vger.kernel.org
Message-Id: <b8783289-6670-4254-9049-786ae7cdd6a1@app.fastmail.com>
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jun 12, 2025, at 15:44, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
>
>   vmlinux: 152864 kB -> 154528 kB
>   Image: 39391 kB -> 39067 kB
>
> No difference in resulting include/generated/autoconf.h, except making
> modules: SND_SOC_SAMSUNG, SND_SOC_SDCA_OPTIONAL, SND_SOC_APPLE_MCA,
> SND_TIMER, SND_COMPRESS_OFFLOAD, SND_PCM, SND_SOC_SOF_OF and
> SND_DMAENGINE_PCM.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> If patches are fine, I will take them via Samsung SoC.

Nice find!

Acked-by: Arnd Bergmann <arnd@arndb.de>

There are some nasty interactions between DRM drivers calling
into sound drivers for HDMI audio, but I checked that this is fine
here because of CONFIG_DRM=m.
