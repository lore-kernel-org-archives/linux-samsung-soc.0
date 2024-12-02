Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7BA16DC28;
	Mon,  2 Dec 2024 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733155802; cv=none; b=DVBnOpCh54ZSdIsSOupxYBp/CGsbYHuF4CsrbNHIhJInvwlpwpIidHItolvsjmEN8kDyFxs+8B2Nl24Z/5g+CWvpf4PDOn066yhmaSr8u2tNB6vWfPcFFf3B59gd6Pt1fHfwE7PUfmaCfCd2uQ/s52AGK+mNMwA3gxGsO1NroLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733155802; c=relaxed/simple;
	bh=eIc8t4lKmK5UFIFirTARtrzWQUkYKt0eN41jarQxzs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHvCgzzjbXioL1bX1Mi+uSmmunpvBXP0NpNpi3ghsU7toGJ6+8FNwnTrQ1glIITXRb2vM0xU8LPnmxYImWbEX8NPlB1RtJB6DW+lHb3MeT/j2NV4JiTRstLu1VJwBI7m0RMjpWPd4Xme5JMiYcaBuW0NVfa9uaTaLTK3fqluiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=Kckp/CmE; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="Kckp/CmE"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y27mP3Tlgz4wFG;
	Mon, 02 Dec 2024 16:00:37 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y27mF2LK8z6tkK;
	Mon,  2 Dec 2024 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733155232;
	bh=eIc8t4lKmK5UFIFirTARtrzWQUkYKt0eN41jarQxzs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kckp/CmEX++1vMkL4CETxaUQW9hRAQnBhErrEwBAFC9cZ0pM8rCzrx0eCOxIw0eC1
	 qwQXyb0whcyyGzRZq4kV7NoV5/D3MCMrl9zCIDQTOOVF0SlPivgRnzKYtBZDbARfby
	 RBqJUqnYTYI5IVzgWe1Kbg3VJc/cCtiUxpCp3H2mEPUTzxRqOFDKC0AUFrt6xnniyh
	 15M4PSOrPIHwgKcqvGT5vykUcMnxglK8jEJWO4HbfsUWMPBbD1Q4NPmUYVagL0EWGv
	 NsCnoXM3qPNT2IT0eFVxOt4YKBeBZzwdVNrDG9a0VBFq8LG7H8KBbrNnevcjRqmddf
	 cO+CDGxl8oaNg==
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
Subject: Re: Re: [PATCH v3 3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Mon,  2 Dec 2024 16:00:11 +0000
Message-ID: <20241202160011.3232-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <88f6ab28-1b3f-4144-91c8-0131ee008838@kernel.org>
References: <88f6ab28-1b3f-4144-91c8-0131ee008838@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 02/12/2024 8:53, Krzysztof Kozlowski wrote:

> Umer,
>
> I wanted to apply the series, but for two weeks you ignored this
> feedback/comment, so I am dropping the patchset from my queue.
>
> Be sure you respond to reviewers in timely manner (and if you give
> yourself more than two weeks to respond it also means other have more
> than two weeks...).
>
> Best regards,
> Krzysztof

Hi Krzysztof, I did not mean to ignore him, I had mock examinations coming
up when this feedback was sent. I had no chance to reply as i had to prepare
and do good in these examinations as they influence what colleges I get
accepted at. Sorry for any inconvenience caused to both of you.

Best regards,
Umer
