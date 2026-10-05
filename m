Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C0F4779A1;
	Mon,  5 Oct 2026 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196364; cv=none; b=NSgBluhqWJYDltLUqUXZrsoSh+RF3CqlGeSxuypY5Dep2ObT5eNaYlHWwRXN7k3Jcuhu8GA+ultUWGoveHGms03abd347XSybM9TTNmpdHlK5SddkBRBrZX8Br87Vhoe03vcewP/28akhrqF357Xb3guzk/018XCasZiXhzCmq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196364; c=relaxed/simple;
	bh=LlCPOUvM9WMpK08kANDZYAT8KZzPLS5enR/RzvToJaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzV6dJFvlxSxr6EDS/xdwVg8VMqJVopwN2Z9fFBXqKas+d5N3ZOoS4UHSR9YdQQHQBoYjfzQCgmCGnaU8POB1VF2DsJeef2aLI6QrvtH0cOD7GTKfdepxwMs04vPNn3MM71UjWtHFyP5RbVd2BN+ryu9YU0kuZQZOBwy3PIyHks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qg9d6ujq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg9d6ujq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5241F00893;
	Mon,  5 Oct 2026 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196362;
	bh=jY57LCuzIB5cNlu7Zk9xX9Q8qlrsSL3Pf/+RUB89afs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qg9d6ujqzge+IpM1ektEAwAf0FC8IWgedGirL+BlhF59dKLVL0a3LWOAN5pZOJO+n
	 LmLchH4o6Wjuo3Sw+L7vvZ6ba9ojzBwIJlUYBqF/ELZ0AV3H4JbFfkduVVJ9yk1KQF
	 6+SOseFUNx6xZJ6rlqF1p8xZTWf3t1ayZ+bOhKBk4ijM1n9T1fAXp095457dkwz3KH
	 XOEP4hMz9t8SHHWKForvJzW++YHHsflktY37eDQ34Y2s207+Jy1abgDb1Ihf3pSDKr
	 Nat0KTX9Vq3Qlehjrch7+qAC2ht/qQ2EKgCdlClwbT97/Rwnu3NbCNVWv1r02XUOU+
	 n1qoqIgEV5Asw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] ARM: dts: dt cleanup for v7.4
Date: Mon,  5 Oct 2026 12:32:32 +0200
Message-ID: <20261005103232.37247-4-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005103232.37247-3-krzk@kernel.org>
References: <20261005103232.37247-3-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=krzk@kernel.org; h=from:subject; bh=LlCPOUvM9WMpK08kANDZYAT8KZzPLS5enR/RzvToJaM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3zBnjHD6v/uV/d1peYGEvHkch8KOGBVcvEP6 UKiivz8TIqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN8wQAKCRDBN2bmhouD 1/82D/99F8nJVOUMSUxl38vWKbGP5Sg7qGlA6RUiGDRoVo5GU2rCvPLXaPfaWdTUBpKP828H8tb 7NlKRi9L9Wu1+rY6Hid1JS3594YWSubHpvTwXyiCcvsYLoCo6lpN3KgSzYWt3FZlgwblwg7VBii GmcLOyiSmdnqkmbbRtHknrbrVQrK7swAUfcZhB0NP6/usEj8syYHyiGIuFcgA3dwxE9uhI3s5K6 Z+2FLDzwTpFafz7BEWz9hAfEIOyPmtMnbNQH8FA4xyU6VfLD3O/jtgfb6YAOVrjt1aJMZMW4hxX vapTi2AKpNKWIOYfZJDVbscQJR8aWld3W/VvTkAGMbJKsL+QbZwoZ4j733q3xu25edwea1xZOLm 6+KJe5j6fQl7um2zQ7BnU4ZOeUmOkC1zG9fwq3ZiR4/7EuLdH9kdsGNMbayF5CCLiAIj3D3eFFj gveds3G+kRkMVp3cXfyIp2A6cEQVN1pHZlEL1q2NajncdhopC8Umy3BOdnGsls7paStujRmjWGu chgZYRE43jHyKo59VmpYSBSkQTCZ5hprzGNhb0LeKw0fxIGnnfuHEK4NIPytbFUjaAKkuCIuexI 3cxSroPcvTnIoRjl0O6tWcx85rZVevNe/1kAMr4jtxfpgFckXTeDAb9jKMn9eqS3646IaAWsxzg eN3VYKYu8Rs5a6g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-7.4

for you to fetch changes up to 5b21342479d303b98796ee50a50642843318e92f:

  ARM: dts: aspeed: Replace spaces indentation with tabs (2026-09-19 08:41:20 +0200)

----------------------------------------------------------------
Minor improvements in arm DTS for v7.4

A few more or less trivial style cleanups pointed out by dt-check-style
for Actions, Aspeed and ARM vexpress platforms.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: actions: owl-s500: Replace spaces indentation with tabs
      ARM: dts: vexpress-v2p-ca5s: Replace spaces indentation with tabs
      ARM: dts: aspeed: Replace spaces indentation with tabs

 arch/arm/boot/dts/actions/owl-s500.dtsi                   | 12 ++++++------
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts               |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts   |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
