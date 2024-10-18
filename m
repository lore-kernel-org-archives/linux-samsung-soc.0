Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF118870E;
	Fri, 18 Oct 2024 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729234122; cv=none; b=dKs+cPhGEXmqFdEhKoIZCbWxQMSH0w+RYgE5BVjlWz+kFVUwBPZDlt+euV11mdICd2jdJ8FD5u2zyBdyincgIgHMJ7lMujYmoy6i22WafZv21RElSFvGVCKqmIpNyzyCYD8tgDp7Ebal0v19e5mXW4Pb+65Dhapeh+CJDYqADN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729234122; c=relaxed/simple;
	bh=W6MRMooV4KIbuAB4G1Eb0IADwXOO0fFsGsXZB5TQvsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WONewA6cB6AHDHJXVpxqShfFGlRMJqTYENSqWJmm+GQ1EG256KgquXt6s1BrtF0xisd2jCYA1oj6T3k0QQDETpVMuhmVzCVKIL8eBZ1FKoEicLNRJs2btuYF5Dy37x5HAgd8Voa6ZUherqv4icNcuqaxyu+dZWGipeGknZWTzCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=RfjjB12t; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="RfjjB12t"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XVFfG70ywz4wGF;
	Fri, 18 Oct 2024 06:48:38 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XVFf72njWz8sWP;
	Fri, 18 Oct 2024 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729234113;
	bh=W6MRMooV4KIbuAB4G1Eb0IADwXOO0fFsGsXZB5TQvsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RfjjB12tatr36v75Air+pnDXRPNaEdcz6Im5Ofv4fXW0vQ5zHitQoEJmNF1QsBMS2
	 lQYeJy1zbaEzm5aoWWjUPCUrKRWH/RuHOFPI08TYmEbWnPFp8nedHTFvI35Qs+oUX4
	 Wv3WYgEE318DXAbSjE/AnuIj1QJta7ppt+WV5Ea8YEYAjlEERuwWOdlNZZE+97xHix
	 JyEs5q/Cv9NMtUBCy9n39C4siaGV+8Eyw/twm1ISN0MfYswc8SLaH7+lcxm2gTcEzl
	 qG/e6netfJcsC2SROOQjtMpF6h7jAF4lO+yB51hewxj3lxhbD/c+kQTVMlSLveb5u8
	 Dk6aMiuYOR2AA==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	robh@kernel.org,
	umer.uddin@mentallysanemainliners.org
Subject: Re: Re: [PATCH v2 0/4] Add minimal Samsung Galaxy S20 Series board, SM-G981B and SM-G980F support
Date: Fri, 18 Oct 2024 07:48:28 +0100
Message-ID: <20241018064828.18576-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <ncckonzlc7fjt6vhw543iqoua4qx7hjgexj6lxyaldzcvbtutx@luazzw3rmjcd>
References: <ncckonzlc7fjt6vhw543iqoua4qx7hjgexj6lxyaldzcvbtutx@luazzw3rmjcd>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 17, 2024 at 05:43:27PM +0100, Umer Uddin wrote:
> > Add initial support for the Samsung Galaxy S20 (x1slte/SM-G980F)
> > phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
> > has only one configuration with 8GB of RAM and 128GB of UFS 3.0 storage.

> 8 GB RAM, so the memory map should not be the same (and should not be in
> DTSI file).

> >
> > This device tree adds support for the following:
> >
> > - SimpleFB
> > - 8GB RAM
> > - Buttons

Best regards,
Krzysztof

Hi Krzysztof,

Thank you for the review.
All hubble devices actually do
have the first 8GB of RAM mapped the same, I have personally
checked this, by getting fdt dumps from /sys/firmware/fdt
and checking all of the memory nodes.

Best regards,
Umer
