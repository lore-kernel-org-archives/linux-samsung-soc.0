From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: SAMSUNG: Add keypad device support
Date: Sun, 30 May 2010 13:46:03 +0900
Message-ID: <AANLkTilt_-UAZGZepwtIYM7HRuPsX7gsW_ppLZD1_bZq@mail.gmail.com>
References: <1275188784-23395-1-git-send-email-jy0922.shim@samsung.com>
	<201005300542.37715.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <201005300542.37715.marek.vasut@gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, kyungmin.park@samsung.com, dmitry.torokhov@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, May 30, 2010 at 12:42 PM, Marek Vasut <marek.vasut@gmail.com> w=
rote:
> Dne Ne 30. kv=C4=9Btna 2010 05:06:20 Joonyoung Shim napsal(a):
>> +struct samsung_kp_platdata {
>> + =C2=A0 =C2=A0 const struct matrix_keymap_data *keymap_data;
>> + =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
rows;
>> + =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
cols;
>> + =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
rep;
>
> I don't know, maybe using uint32_t here? On ARM, it doesn't matter so=
 far as int
> will be always 32bit, but maybe we should just type the variables wel=
l ?

I thought int was 32bits on all archs
--
To unsubscribe from this list: send the line "unsubscribe linux-input" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
