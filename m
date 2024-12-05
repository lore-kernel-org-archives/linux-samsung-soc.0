Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA2022D4D0;
	Thu,  5 Dec 2024 19:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733428003; cv=none; b=sJOLTsyKUkoiRuF60eDptLsLzZV1aS+tr1FWXbGiPtZzrSv8Cj1RKeReYD83OAMVqvNNn1ykmN1EfNMVkS/P219i1s2dbNcJzZf/vAkAwXuz6F2HY9XuTtCmuSK5ahTpS5DNxqKtgWKYsEtZHmbWateDG6aW2n6Owqilc2i/fhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733428003; c=relaxed/simple;
	bh=rZB2ZD8newIecgF9YojZivONnPnrHJekLCe8GgtmLrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IW4TN2rLAwtbZ/ztkmyqVIHk0DoLzEqJ/umdiNeWfCgogb9p9TqmDMhjEoHwYyAR8a0sZ77lQEQiFZ60l/ntEolELi2Wyh7lr8d7/6EyXmlxlQBF/n2F4KBcM5zeBzyZa3UZlhlVGLT5OO39Tv9za11XsPvqjFDIoVEKtabrYac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=hegvWNRZ; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="hegvWNRZ"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44dr5J0LzGpBc;
	Thu, 05 Dec 2024 19:46:40 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44dh2ZxXz8sWP;
	Thu,  5 Dec 2024 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427995;
	bh=rZB2ZD8newIecgF9YojZivONnPnrHJekLCe8GgtmLrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hegvWNRZU5ZFZpW7KcC7fxBgIuB3Gotjw80+pfAtWdtzl8/sBSLGgSjEd3WT26LX5
	 XJIUhw1rWmeFRFAY07d9Aw7aqGsMeshGivnvs6kvE1f2TZi+VhkrRjVAW+orLIZTZr
	 17PXlwXgff/Mu7XosYdK7Lqnmq+Eg/FwWiHZ0Vp/u29dVJpNhIL3l83TvFTW8lWoTR
	 hmz6chUC/Tgj4rHiUvhxGgIsE0mjs6pRFEV2uMYsRVbnysJBL2jJ7YsUXl82WFov4T
	 rf1N63jOr3/5ziMlHOcZNqC9vxsDq5sb+tWQ52x74WFk/PX3Bp7rvNcHrKFyP/M9Fd
	 zg1jeniAJL4HQ==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: igor.belwon@mentallysanemainliners.org
Cc: alim.akhtar@samsung.com,
	conor+dt@kernel.org,
	cw00.choi@samsung.com,
	devicetree@vger.kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	mturquette@baylibre.com,
	robh@kernel.org,
	s.nawrocki@samsung.com,
	sboyd@kernel.org
Subject: Re: Add Exynos990 CMU support
Date: Thu,  5 Dec 2024 20:45:10 +0100
Message-ID: <20241205194510.786973-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
References: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm terribly sorry for the garbage as the subject. It was my editor adding in
some cached metadata(?). Will resend this patch if deemed necessary.
