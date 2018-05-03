From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] arm: exynos/s3c: dts: Remove leading 0x and 0s from
 bindings notation
Date: Thu, 3 May 2018 20:53:42 +0200
Message-ID: <20180503185342.zawmhazzvkkdc3ja@kozik-lap>
References: <20180502201153.7459-1-malat@debian.org>
 <20180503184454.19131-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180503184454.19131-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 03, 2018 at 08:44:53PM +0200, Mathieu Malaterre wrote:
> Improve the DTS files by removing all the leading "0x" and zeros to fix the
> following dtc warnings:
> 
> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
> 
> and
> 
> Warning (unit_address_format): Node /XXX unit name should not have leading 0s
> 
> Converted using the following command:
> 
> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed  -i -e "s/@\([0-9a-fA-FxX\.;:#]\+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1 {/g" -e "s/@0\+\(.*\) {/@\1 {/g" {} +

The firmware node is fixed but in my case the command is doing much
more:

-			smp-sysram@0 {
+			smp-sysram@ {

-			port@0 {
+			port@ {

Best regards,
Krzysztof
