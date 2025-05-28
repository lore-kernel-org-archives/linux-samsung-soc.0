Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295761FFC59
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 May 2025 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429918; cv=none; b=P+l66t/VyTIsLesauRBAr4mdCKJGtUMPAZYOpA8Ll9FAZdjCLIsgPiJn9yVigEda8g3S2VuqEorGDHCUFcXD6XCkUYh59QSue1zCq4AzDIpI4mZJlwQzVBc39mqGyBQ4FNBT7NHvvuk+m7/ahD2pmZmZ6xX6w9thM8+Sj3gV1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429918; c=relaxed/simple;
	bh=ACJQEalUXxRkfOQcf468xb3czMGJCzQRNaMVwiWd02I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EfJlY1GFlMFEUMK5qO8rsEboKjFRn9noR6+zEbwFCMNJD1AfEyncbCaxdlqvvhWN2rruVqMHylB38t/VUUuvDNlhbReys2Db42Tstjy1MMDSGxVtoXcScPHrBrRuGCoN0tiuYQzRLD/1Sa3gKyrqjQOOTwmepz0ykepzY1fkRkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=wC/syr52; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="wC/syr52"
DKIM-Signature: a=rsa-sha256; b=wC/syr52wMuulMUWKYZxuolTsF1tja0scH6jnxyivCHhSz4RbP050A+IKhYWyLEeD0dl68gxeCGSr6HA/WNGCBCyEL/7WQkQsimaNr/P3Nd2+H6tdnLyN7Q2HIb0CJJhVIPx7oYur2I+mhqdIcQALbp5rV4bcAX9NZGibeH8Amrbxb5rYC+pwsxCTGwoTMha2ujuruVgzXI9qZvurbzli3X+6WfACbKwCN19XicIKo8ohPqwCssUxmx3Dsc50TrmFOQP/ux+QxkQS8LJyzsbOI7W8ysnrNMyWHfF5sVUJfXAGBqwGhRWB23Ec22lu4ncif5Ru7IYKGLuIF08zNw2aQ==; s=purelymail3; d=purelymail.com; v=1; bh=ACJQEalUXxRkfOQcf468xb3czMGJCzQRNaMVwiWd02I=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 715274949;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:58:23 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] Enable CMU_HSI1 for Exynos990
Date: Wed, 28 May 2025 11:58:20 +0100
Message-ID: <20250528105821.158140-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Hi all.

This series enables a new clock block (CMU_HSI1) for the Exynos990
SoC. This clock block provides clocks for the DesignWare MMC
Controller, PCIE subsystem and UFS subsystem.

This patch depends on the following series:

[CMU_HSI1] https://lore.kernel.org/linux-samsung-soc/20250528105252.157533-=
1-umer.uddin@mentallysanemainliners.org/

Best regards,
Umer Uddin.

Umer Uddin (1):
  arm64: dts: exynos990: Add CMU_HSI1 node

 arch/arm64/boot/dts/exynos/exynos990.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

--=20
2.47.2

