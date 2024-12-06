Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5C710E0;
	Fri,  6 Dec 2024 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499933; cv=none; b=Vr5NSIUT9IDegevIt7BlCs8h8qd+BTYGguOF/2eNa1B9hvath3OrbHJuCPfozFu7s0D3BvrlUlh0qWZ4NWwYBVacm4t9Ck1oxdhfLiPcFr6JF1mK489PBo5kMiALI19SC4MYzbJ86p7k9GMyT1NJ0AifwveO839toxzdlbkk8k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499933; c=relaxed/simple;
	bh=jbEhDaMhaYRgHqg0j3y6E2dzcgnzRa0+yf2IRP/gbrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVlJoM+boguOj3UHJQxatLWXmTa3zzuLbu6+4xL7Wc9mccQCOXPS27AlPVEZ9AXHBRC4wUMPoBY8OQtWcw8AzsUW8JO4WY8+l6DxiDJ7EAHi4+csrUXmS1QVUCfMXFYRSKIJjVLYMhf0wxUOyaze44IUfMpf9AnLEvS9qDMq4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=JiMNspDu; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="JiMNspDu"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4bF65XZZz4w8J;
	Fri, 06 Dec 2024 15:45:30 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4bDy6GfCz8sWh;
	Fri,  6 Dec 2024 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499925;
	bh=jbEhDaMhaYRgHqg0j3y6E2dzcgnzRa0+yf2IRP/gbrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiMNspDuRphE9o3eaOZTf9bLQRkKlANAM+5hkXxAlwBtfYett3c1bD0njT1udq7U6
	 LP6SB1EJ/rGe9CrS+XotbLwGo+gTxTtLMBWBGDdjxeWiwmWi7VC085WFmd/mbVZA+v
	 GldaTpMIR+igDUQjiLTkFzwr1SoU/h7JTXBmsEe1zH439fIDeLLY2yWl8WRSTtMTpA
	 2zxPn+8BqOxhwPOvQI6qQaf8+VfVocDYIoyartHRF6Wz5yq6jh9ipRjFMvQbEltLG1
	 +ulb42RmhHvnKS84p9gNu3PAY7h4GIPxlmgQZOKDLwBtHhzy0dZaZUbDhDnwXxv5eQ
	 J8F0jLyDMbs8w==
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
Date: Fri,  6 Dec 2024 15:45:08 +0000
Message-ID: <20241206154508.4426-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <5e3e43eb-3afc-486e-aa9a-4c1074fd30b8@kernel.org>
References: <5e3e43eb-3afc-486e-aa9a-4c1074fd30b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 06/12/2024 14:11:28 +0100, Krzysztof Kozlowski wrote:

> Keep the order (sorted).
>
>
> Best regards,
> Krzysztof

Hi Krzysztof, really sorry that had went through, I had seen the error,
but by then it was too late and it was already sent off... I have
sent v5 off though, which should merge properly as the order has been
fixed.

Best Regards,
Umer
