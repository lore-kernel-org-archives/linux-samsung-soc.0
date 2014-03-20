From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Move exynos-audss-clk.h to
 dt-bindings/clock
Date: Fri, 21 Mar 2014 04:32:21 +0900
Message-ID: <532B4245.90705@samsung.com>
References: <1394085884-13081-1-git-send-email-tushar.behera@linaro.org>
 <1394085884-13081-3-git-send-email-tushar.behera@linaro.org>
 <531D054E.70008@gmail.com> <53277548.60300@samsung.com>
 <532858E7.3040802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <532858E7.3040802@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, pawel.moll@arm.com, linux-doc@vger.kernel.org, ijc+devicetree@hellion.org.uk, Tomasz Figa <tomasz.figa@gmail.com>, robh+dt@kernel.org, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, rob@landley.net, galak@codeaurora.org, plagnioj@jcrosoft.com, linux@maxim.org.za, linux-arm-kernel@lists.infradead.org, Tushar Behera <tushar.behera@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/18/14 23:32, Tomasz Figa wrote:
> On 17.03.2014 23:20, Kukjin Kim wrote:
>> On 03/10/14 09:20, Tomasz Figa wrote:
>>> On 06.03.2014 07:04, Tushar Behera wrote:
>>>> Most of the clock related dt-binding header files are located in
>>>> dt-bindings/clock folder. It would be good to keep all the similar
>>>> header files at a single location.
>>>>
>>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>>> CC: Kukjin Kim <kgene.kim@samsung.com>
>>
>> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>>
>> Or shall I take this into samsung tree?
>
> I guess so.
>
> Or should this whole series go through DT tree?
>
OK, I've applied into samsung tree.

Thanks,
Kukjin
