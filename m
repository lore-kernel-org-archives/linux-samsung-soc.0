From: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v3] arm: exynos/s3c: dts: Remove leading 0x and 0s from
 bindings notation
Date: Thu, 3 May 2018 20:58:25 +0200
Message-ID: <CA+7wUswQDXZTXWFd=mwo8ehFxHkOp0UA-RuO_fVBzoj-7mutSg@mail.gmail.com>
References: <20180502201153.7459-1-malat@debian.org>
 <20180503184454.19131-1-malat@debian.org>
 <20180503185342.zawmhazzvkkdc3ja@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180503185342.zawmhazzvkkdc3ja@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 3, 2018 at 8:53 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, May 03, 2018 at 08:44:53PM +0200, Mathieu Malaterre wrote:
>> Improve the DTS files by removing all the leading "0x" and zeros to fix the
>> following dtc warnings:
>>
>> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
>>
>> and
>>
>> Warning (unit_address_format): Node /XXX unit name should not have leading 0s
>>
>> Converted using the following command:
>>
>> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed  -i -e "s/@\([0-9a-fA-FxX\.;:#]\+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1 {/g" -e "s/@0\+\(.*\) {/@\1 {/g" {} +
>
> The firmware node is fixed but in my case the command is doing much
> more:

Looks like I cannot copy/paste correctly, meant to say:

find . -type f \( -iname "*.dts" -o -iname "*.dtsi" \) -exec sed  -i
-e "s/@\([0-9a-fA-FxX\.;:#]\+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1
{/g" -e "s/@0\+\(.\+\) {/@\1 {/g" {} +

> -                       smp-sysram@0 {
> +                       smp-sysram@ {
>
> -                       port@0 {
> +                       port@ {
>
> Best regards,
> Krzysztof
