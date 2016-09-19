From: ayaka <ayaka@soulik.info>
Subject: Re: [RFC PATCH v3 1/2] ARM: dts: samsung: add rga-lvds panel in itop
 elite
Date: Tue, 20 Sep 2016 03:17:02 +0800
Message-ID: <1c993577-cb51-16a7-2eba-344156959fb8@soulik.info>
References: <1474311771-23321-1-git-send-email-ayaka@soulik.info>
 <1474311771-23321-2-git-send-email-ayaka@soulik.info>
 <CAOMZO5Agngx7b24bo3w7S84xtwZV81c-wAszs0B96FZhMeMW8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5Agngx7b24bo3w7S84xtwZV81c-wAszs0B96FZhMeMW8A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Russell King - ARM Linux <linux@armlinux.org.uk>, krzk@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org



On 09/20/2016 03:12 AM, Fabio Estevam wrote:
> On Mon, Sep 19, 2016 at 4:02 PM, Randy Li <ayaka@soulik.info> wrote:
>
>> +       vcc_sys_lcd: sys-lcd {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc_5v";
>> +               regulator-min-microvolt = <5000000>;
>> +               regulator-max-microvolt = <5000000>;
>> +               gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
> Is this really active high? If so, you should add the
> 'enable-active-high' property.
I see, thank you. Btw, let me make it clearly, it is really an 
independentTransistor, not be controlled by PMIC.
