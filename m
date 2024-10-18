Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6D9201273;
	Fri, 18 Oct 2024 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729268429; cv=none; b=YomHfubMa9pk29vx2CYkCY26bLqVNbaHbsyZymXJ5oPnVyXXF3YT0ESfp8uLGCE48Ie1u3vFlpa9nI/ONK3eOC+fQcFVlREVES/dSIXkaUVXmXhF+1DFQu/3Ngj3sTZ4DoUIW+R/EWzWnk4MLqvB3gVIcMrsGUBGu8+CNL6zJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729268429; c=relaxed/simple;
	bh=OkQPVxKBsaQBEkOEt+X4GZP1cp3gyraw/SKK7sKJH50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZ5r5aCeU/VuX5fXwZs9mgUL5aRskfMuvpx0IboplJ1tFEy7w6IdFfcuIjDlxxfffnd+tYNJpj1ZYhakCicjoqmZOe3QR4fJOu3pI+pwIraH5qb1xtLaUmu+2GA4cjmXiRU6vQA9488m5onIUFSBarOVW2DOpNp4RCPzQ4iebyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=ez2vvAj6; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="ez2vvAj6"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XVVL21qZRzGpGV;
	Fri, 18 Oct 2024 16:20:26 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XVVKt3Lbqz6tkK;
	Fri, 18 Oct 2024 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729268420;
	bh=OkQPVxKBsaQBEkOEt+X4GZP1cp3gyraw/SKK7sKJH50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ez2vvAj6/vkgQv6QJZflxua50BksIbcDPHJI+TBybm/VEnXMRKFKOGKJ/daKwDQQ2
	 oI6ZFjratS6hBSzCHkWOTlaQO2M/THe3maZUuvAgZluvpXCQ255f6xjDiCeo20a7oh
	 NKASmOHd0K5Idqx778POS5QnDlnpMRf2arnPk10WA0EJsm1LugnIdKZl2d8r7XS/km
	 sJpJQVOKO1wgv0neWA8ofv3xoX9SYaTiEKcOvPsmdSQZFMXDJRm148yj3ALNDluA4i
	 zE3DexnrJqRf6/08DqHLIF53uEwDHKRzaBSuGpO+nQjT5eIv3Yfy6vHhnjM1sLq6T/
	 CrIvFe4YdqMMw==
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
Date: Fri, 18 Oct 2024 17:20:03 +0100
Message-ID: <20241018162003.21648-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <1c5d1274-2ea8-4cb8-a42b-04ae30bc6f1a@kernel.org>
References: <1c5d1274-2ea8-4cb8-a42b-04ae30bc6f1a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Oct 2024 09:14:01 +0200, Krzysztof Kozlowski wrote:

> What about remaining 4 GB on X1S?

On x1s, the remaining memory is mapped in the device specific dtsi.

Best regards,
Umer
